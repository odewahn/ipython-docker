FROM ubuntu
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN apt-get update
RUN apt-get install -y ruby1.9.3
RUN apt-get install -y python-software-properties python-dev python-pip
RUN apt-get install -y libfreetype6-dev libpng-dev libncurses5-dev vim git-core build-essential curl unzip


# Install Atlas-specific gems
RUN gem install bundler atlas-api atlas2ipynb

# Install ipython notebook requirements
RUN pip install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
RUN pip install numpy==1.7.1
RUN pip install -r /tmp/requirements.txt --allow-unverified matplotlib --allow-all-external


# Now install ipython notebook specific stuff
RUN adduser --disabled-password --home=/home/docker --gecos "" docker
