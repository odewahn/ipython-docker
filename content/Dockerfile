#
# This is a sample dockerfile for spinning up a content image
# Basically, it starts the base box and then uses the 
# atlas api to load up the content
#
FROM odewahn/atlas-base
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 


#
# Use atlas-api to build the project and install it on the docker image
#
USER atlas
WORKDIR /home/atlas
RUN atlas2ipynb qexSCMsc2fKDTFEDLfm9 odewahn/atlas2ipynb-sample

