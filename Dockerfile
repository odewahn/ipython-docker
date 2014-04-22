FROM ubuntu
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN apt-get update
RUN apt-get install -y libfreetype6-dev libpng-dev libncurses5-dev vim git-core build-essential curl unzip

# Install rbenv using the recipe from
#    https://github.com/tcnksm/docker-rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

# Install multiple versions of ruby
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 1.9.3-p392 
RUN rbenv global 1.9.3-p392 

# Install Atlas-specific gems
RUN gem install atlas-api atlas2ipynb

# Now install ipython notebook specific stuff
RUN echo 'alias nbserver="ipython notebook --ip=0.0.0.0 --port=8888 --pylab=inline --no-browser"'  >> ~/.bash_profile
