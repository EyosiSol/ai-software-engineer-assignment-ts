# AI Experts Assignment (JS/TS)

This assignment will be subimmted to Eskalate Hiring team and it has evaluated my ability to:

- set up a small JavaScript/TypeScript project to run reliably (locally + in Docker),
- pin dependencies for reproducible installs,
- write focused tests to reproduce a bug,
- implement a minimal, reviewable fix.

## How to run this Project

## Run Tests LOCALLY

### Install the dependencies first

```bash
npm install
```

### Run the test

```bash
npm test
```

- This will run the vitest run of all the tests

## Run Test using Docker by creating the image

### Is docker installed?

- Make sure that docker is installed in your machine

```bash
docker --version
```

- If so it will yeild `Docker version (versionNumber), build (buildnumber)`

### Build the Docker Image

```bash
docker build -t aisoftwareengineeringassignment .
```

#### Note: instead of aisoftwareengineeringassignment you can have the name set by urself just make sure it is all lowercase

### Run the built Docker Image

```bash
docker run --rm aisoftwareengineeringassignment
```

- After running this the docker will automatically run the `npm test`
