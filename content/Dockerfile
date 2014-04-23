#
# This is a sample dockerfile for spinning up a content image
# Basically, it starts the base box and then uses the 
# atlas api to load up the content
#
FROM odewahn/ipython-docker
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 

RUN adduser --disabled-password --home=/home/atlas --gecos "" atlas
USER atlas

#
# Use atlas-api to build the project and install it on the docker image
#
WORKDIR /home/atlas
RUN atlas2ipynb qexSCMsc2fKDTFEDLfm9 odewahn/python-data-analysis-ipynb-test
RUN mv python-data-analysis-ipynb-test content
#
# Create the command to actually run the ipython notebook
#
WORKDIR /home/atlas/content
RUN echo '#!/bin/sh' > start.sh
RUN echo 'ipython notebook --ip=0.0.0.0 --port=8888 --pylab=inline --no-browser'  >> start.sh
RUN chmod +x start.sh

