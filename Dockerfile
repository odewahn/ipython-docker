FROM ubuntu
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN apt-get update
RUN apt-get install -y ruby1.9.3
RUN apt-get install -y libfreetype6-dev libpng-dev libncurses5-dev vim git-core build-essential curl unzip python-pip

# Install Atlas-specific gems
RUN gem install bundler atlas-api atlas2ipynb

# Install ipython notebook requirements
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --allow-unverified matplotlib --allow-all-external


# Now install ipython notebook specific stuff
RUN adduser --disabled-password --home=/docker --gecos "" docker
RUN echo 'alias nbserver="ipython notebook --ip=0.0.0.0 --port=8888 --pylab=inline --no-browser"'  >> /home/docker/.bash_profile
