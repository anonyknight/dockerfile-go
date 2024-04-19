# Dockerfile Go

Docker and containerization becomes de-facto-standard nowadays.
However, vanilla dockerfile waste disk spaces and cost network bandwidth to transfer it.

This repo intends to provide dockerfile for go projects to support multiple stage docker builds.
We can see the vanilla docker image is 92+ times larger than the minimum docker images.

Step 1: install the necessary library and dependencies, build the binary
Step 2: only package the target and required executibles into docker.

## Vanilla docker build

```bash
docker build --platform linux/amd64 -f docker/vanilla.Dockerfile -t hello-world-vanilla .
```

```bash
$ docker images
REPOSITORY                 TAG       IMAGE ID       CREATED          SIZE
hello-world-vanilla        latest    60522a1e34cc   19 seconds ago   845MB
```

## Two stages docker build

```bash
docker build --platform linux/amd64 -f docker/2stages.Dockerfile -t hello-world-2stages .
```

```bash
$ docker images
REPOSITORY                 TAG       IMAGE ID       CREATED         SIZE
hello-world-2stages        latest    ed307e756162   5 seconds ago   9.15MB
```

## Reference

[Docker-multi-stage](https://docs.docker.com/build/building/multi-stage/)
