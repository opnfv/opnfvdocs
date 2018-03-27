# OPNFVDoc tool readme
------------------------

This docker container is used for building OPNFV docs from **rst** format files for each feature
project. The output is just like contents in [opnfvdocs](http://docs.opnfv.org/) website. You can
review the contents through web browser. Currently *PDF* output is not good enough and it will make
the container image size 3x larger. PDF output format is not supported in this release.

# Usage

* The default build is *html*, you can run:
```
docker run -it --rm -v ./some-opnfv-repo:/docs -v /tmp/output:/output \
     opnfv/opnfvdocs
```

* Then if you want to build epub, etc you could pass it as an arg:
```
docker run -it --rm -v ./some-opnfv-repo:/docs -v /tmp/output:/output \
     -e build=epub opnfv/opnfvdocs
```

## env parameters
* build: [html | singlehtml | epub]

## two directory parameters
* /docs: **mandatory**, used for source files
* /output: **optional**, used for storing the built result
