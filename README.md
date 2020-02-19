# Docker image for uwget

To run uwget tool inside docker container.

Can be useful to do some diagnostics/testing inside a docker environment where an uwsgi container is running without the 'http' module.

## uwget
uwget(https://github.com/m-messiah/uwget) is a simple tool to do requests with [uWSGI protocol](https://uwsgi-docs.readthedocs.io/en/latest/Protocol.html).

## Example

```console
docker run --rm jorritwehelp/uwget -host example.com uwsgi://uwsgi-container-name:9090
```

## Image info
Seperate build step, statically compiles uwget from github repo.
Runtime image from scratch, only contains uwget binary.
