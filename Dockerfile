FROM siuyin/ubuntu:build-essential
RUN apt install -y zlib1g zlib1g-dev libssl-dev libreadline-dev
ADD ruby-1.8.7-p357.tar.gz /build/
ADD rubygems-1.3.5.tgz /build/
RUN cd /build/ruby-1.8.7-p357 && export CFLAGS="-O2 -fno-tree-dce -fno-optimize-sibling-calls" && ./configure && make && make install
RUN cd /build/rubygems-1.3.5 && ruby setup.rb
CMD ["bash"]
