#
# This is a sample dockerfile for spinning up a content image
# Basically, it starts the base box and then uses the 
# atlas api to load up the content
#
# Before running this, be sure to set the following environment variables
#
#   export ATLAS_KEY=<your atlas API key>
#
FROM odewahn/atlas-base-new
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 

RUN sudo apt-get install -y python-pip python-dev build-essential libatlas-base-dev 
RUN sudo apt-get install -y gfortran gcc-multilib lynx emacs23-nox 
RUN sudo apt-get install -y glpk python-glpk

#
# Use atlas-api to build the project and install it on the docker image
#
USER atlas
pip install scipy
pip install neurolab
pip install hyperloglog                                      
pip install countminsketch # or build from GitHub repo
pip install pybloom               
pip install lshash # or build from PyPi tarball

WORKDIR /home/atlas
RUN atlas2ipynb $ATLAS_KEY $ATLAS_PROJECT odewahn/jem-docker