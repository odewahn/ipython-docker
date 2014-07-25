#
# This is a sample dockerfile for spinning up a content image
# Basically, it starts the base box and then uses the 
# atlas api to load up the content
#
# Before running this, be sure to set the following environment variables
#
#   export ATLAS_KEY=<your atlas API key>
#
FROM odewahn/atlas-base
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 

#
# Install systemwide requirements
#

RUN apt-get install -y libatlas-base-dev 
RUN apt-get install -y gfortran 
RUN apt-get install -y gcc-multilib
RUN apt-get install -y lynx 
RUN apt-get install -y emacs23-nox 
#RUN apt-get install -y glpk 
#RUN apt-get install -y python-glpk


#
# Install python packages using pip
#
RUN pip install scipy
RUN pip install neurolab
RUN pip install hyperloglog                                      
#RUN pip install countminsketch
RUN pip install pybloom               
#RUN pip install lshash


#
# Install content using atlas-api to build the project
# Be sure to set ATLAS_KEY as an environment variable!
#   export ATLAS_KEY=<your atlas API key>
#
USER atlas
WORKDIR /home/atlas
RUN atlas2ipynb qexSCMsc2fKDTFEDLfm9 odewahn/jem-docker
