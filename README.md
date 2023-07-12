# Mockintosh

## Introduction
Mockintosh is a service virtualization tool that's capable to generate mocks for **RESTful APIs** and communicate
with **message queues**
to either mimic **asynchronous** tasks or to simulate **microservice architectures** in a blink of an eye.

The state-of-the-art mocking capabilities of Mockintosh enables software development teams to work
**independently** while building and maintaining a **complicated** microservice architecture.

Key features:

- Multiple services mocked by a single instance of Mockintosh
- Lenient [configuration syntax](https://mockintosh.io/Configuring.html)
- Remote [management UI+API](https://mockintosh.io/Management.html)
- Request scenarios support with [multi-response endpoints](https://mockintosh.io/Configuring.html#multiple-responses)
  and [tags](https://mockintosh.io/Configuring.html#tagged-responses)
- [Mock Actor](https://mockintosh.io/Async.html) pattern for Kafka, RabbitMQ, Redis and some other message bus protocols
- GraphQL queries recognizing

_[In this article](https://up9.com/open-source-microservice-mocking-introducing-mockintosh) we explain how and why
Mockintosh was born as a new way of mocking microservices._

## Quick Start

### Install on MacOS

Install Mockintosh app on Mac using [Homebrew](https://brew.sh/) package manager:

```shell
$ brew install up9inc/repo/mockintosh
```
### Install on Windows

Download an installer from [releases](https://github.com/up9inc/mockintosh/releases) section and launch it. Follow the steps in wizard to install Mockintosh.

### Install on Linux

Install Mockintosh Python package using [`pip`](https://pypi.org/project/pip/) (or `pip3` on some machines):

```shell
$ pip install -U mockintosh
```

### Use Demo Sample Config

Run following command to generate `example.yaml` file in the current directory:

```shell
$ mockintosh --sample-config example.yaml
```

then, run that config with Mockintosh:

```shell
$ mockintosh example.yaml
```

And open http://localhost:9999 in your web browser.

You can also issue some CURL requests against it:

```shell
curl -v http://localhost:8888/

curl -v http://localhost:8888/api/myURLParamValue123/action

curl -v "http://localhost:8888/someMoreFields?qName1=qValue&qName2=12345" -X POST -H"X-Required-Header: someval" --data "payload"
```

## Command-line Arguments

The list of command-line arguments can be seen by running `mockintosh --help`.

If you don't want to listen all of the services in a configuration file then you can specify a list of service
names (`name` is a string attribute you can set per service):

```shell
$ mockintosh example.yaml 'Mock for Service1' 'Mock for Service2'
```

Using `--quiet` and `--verbose` options the logging level can be changed.

Using `--bind` option the bind address for the mock server can be specified, e.g. `mockintosh --bind 0.0.0.0`

Using `--enable-tags` option the tags in the configuration file can be enabled in startup time,
e.g. `mockintosh --enable-tags first,second`

## OpenAPI Specification to Mockintosh Config Conversion (_experimental_)

_Note: This feature is experimental. One-to-one transpilation of OAS documents is not guaranteed._

It could be a good kickstart if you have already an OpenAPI Specification for your API. Mockintosh is able to transpile
an OpenAPI Specification to its own config format in two different ways:

### CLI Option `--convert`

Using the `--convert` one can convert an OpenAPI Specification to Mockintosh config.

JSON output example:

```shell
$ wget https://petstore.swagger.io/v2/swagger.json
$ mockintosh swagger.json -c new_config.json json
```

YAML example:

```shell
$ mockintosh swagger.json -c new_config.yaml yaml
```

### Automatic Conversion

If you start Mockintosh with a valid OpenAPI Specification file then it automatically detects that the input is an
OpenAPI Specification file:

```shell
$ mockintosh swagger.json
```

and automatically starts itself from that file. Without producing any new files. So you can start to edit this file
through the management UI without even restarting Mockintosh.

### Running on Docker
On docker, run: 
 ```shell
docker run -d \
    --name mockintosh \
    -v ./config:/usr/src/mockintosh/config \
    -p 8000:8000 \
    ahmeddebbiche007/mockintosh:0.1.0 \
    mockintosh config/config.yml
 ```
 Docker compose config:
 ```yaml
version: '3'
services:
  mockintosh:
    container_name: mockintosh
    image: ahmeddebbiche007/mockintosh:0.1.0
    volumes:
      - ./config:/usr/src/mockintosh/config
    ports:
      - "8000:8000"
    command: mockintosh config/config.yml
 ```

 ## Note
 For full documentation visit [up9inc/mockintosh](https://github.com/up9inc/mockintosh).