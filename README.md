# swagger2spectacle

This Dockerfile create a [Docker](http://docker.com) image to convert swagger yaml to html using [spectacle](https://sourcey.com/spectacle/).

## Description

The docker container which is run from this image convert the swagger 2.0 yaml file to a single html file using below:

* [spectacle](https://sourcey.com/spectacle/)
* [inline-source-cli](https://www.npmjs.com/package/inline-source-cli)

## Install

Pull `nmatsui/swagger2spectacle` from DockerHub:

```bash
docker pull nmatsui/swagger2spectacle
```

Or build `nmatsui/swagger2spectacle` from Dockerfile:

```bash
git clone https://github.com/nmatsui/swagger2spectacle.git
cd swagger2spectacle
docker build -t nmatsui/swagger2spectacle .
```

## Usage

In the directory of swagger file, run this image with mounting current directory and with swagger filename as a command argument:

```bash
docker run --rm --volume $(pwd):/mnt nmatsui/swagger2spectacle swagger_filename.yaml
```

## License

[MIT License](/LICENSE)

## Copyright
Copyright (c) 2018 Nobuyuki Matsui <nobuyuki.matsui@gmail.com>
