# OPNFVDoc tool readme
------------------------

Currently only html result will be output, for in the OPNFV no PDF files
output, there are many issues when PDF is output

# Usage

```
docker run -it --rm -v /tmp:/doc -v /tmp/output:/output \
	-e repo=https://git.opnfv.org/featureproject opnfv/opnfvdocs
```

## env parameters
* repo: upstream repo address used for `git clone`

## two optional directory
* /doc: used for source files to store,
  when env **repo** is used, /doc is not necessary
* /output: used for store the built result
