FROM ubuntu
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN apt-get update
RUN apt-get install -y libfreetype6-dev libpng-dev libncurses5-dev vim git-core build-essential curl unzip

# Copy various install scripts to the container
ADD scripts /tmp/scripts

# Install ruby
RUN source /tmp/scripts/rbenv.sh
RUN rbenv global 1.9.3-p0



# Now install ipython notebook specific stuff

source /tmp/scripts/make_nbserver_alias.sh