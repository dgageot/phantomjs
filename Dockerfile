FROM google/debian:wheezy
MAINTAINER David Gageot <david@gageot.net>

ENV DEBIAN_FRONTEND noninteractive

# From instructions here: http://phantomjs.org/build.html

RUN apt-get update -qq
RUN apt-get install -yqq build-essential chrpath git-core libssl-dev libfontconfig1-dev libxft-dev
RUN git clone -b 1.9 git://github.com/ariya/phantomjs.git

RUN cd phantomjs && (yes | ./build.sh)

RUN mkdir /work
WORKDIR /work

ENTRYPOINT ["/phantomjs/bin/phantomjs"]
