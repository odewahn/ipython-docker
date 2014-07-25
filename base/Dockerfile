FROM ubuntu
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN apt-get update
RUN apt-get install -y ruby1.9.3
RUN apt-get install -y python-software-properties python-dev python-pip
RUN apt-get install -y libfreetype6-dev libpng-dev libncurses5-dev vim git-core build-essential curl unzip wget

# Install Atlas-specific gems
RUN gem install bundler atlas-api atlas2ipynb

# Install ipython notebook requirements
RUN pip install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
RUN pip install numpy==1.7.1
RUN pip install -r /tmp/requirements.txt --allow-unverified matplotlib --allow-all-external

#
# Create the command to actually run the ipython notebook
#
RUN adduser --disabled-password --home=/home/atlas --gecos "" atlas
USER atlas
WORKDIR /home/atlas
RUN echo '#!/bin/sh' > start.sh
RUN echo 'ipython notebook --ip=0.0.0.0 --port=8888 --pylab=inline --no-browser'  >> start.sh
RUN chmod +x start.sh

#
# Set us back to the root user
#
USER root


