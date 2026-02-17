# What is the Problem?

- After installing and running `npx vitest` it appears to be that the third test is failing and it is failing because the the `c.oauthToken` variable is reciving a plain object. this is happening because in the httpClient.ts in the request method:

```javascript
if (
  !this.oauth2Token ||
  (this.oauth2Token instanceof OAuth2Token && this.oauth2Token.expired)
) {
  this.refreshOAuth2();
}
```

# Solution

the above line fails the third test because the refreshOAuth2() method will only run if the condition inside of this is fulfilled and the condition checks the token only if the this.oauth2Token is an instance of OAuth2Token so to fix this issue: rather we change it to

```Typescript
if (!(this.oauth2Token instanceof OAuth2Token) || this.oauth2Token.expired) {
  this.refreshOAuth2();
}
```

# Description:

The problem is a cause beacuse of typescript mixing of uniontypes issue

after changning this all the 3 test cases pass

# Additional Test

The 3 tests cover most of the possible outcome of the situations that might happen. but there needs to be an additional test case `test4` that must be included in my opinion:

- The test token refreshment should run if our token is expired hence to add that test case we can use the OAuth2Token object and create one but the token to be already expired which is

```Typescript
new OAuth2Token("expired",Math.floor(Date.now() / 1000) - 100);  // this will simulate an expired one by utilizing the get Expired() because it returns true or false based on the "now" which is Date.now() / 1000 floored and it gets fired and sends false if the this.expired is less than the now hence by taking that return the httpClient runs the this.refreshOAuth2().
```

so to test this edge case i have written this test case: 

```Typescript
test("api=true refreshes when token is expired", () => {

    const c = new HttpClient();
    c.oauth2Token = new OAuth2Token("expired",Math.floor(Date.now()/1000) - 100);

    const resp = c.request("GET", "/me", { api: true });

    expect(resp.headers.Authorization).toBe("Bearer fresh-token");
  });

```

and the code has successfully has passed all the four test cases. 
