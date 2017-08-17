FROM siuyin/ruby:base-1.8.7 
RUN apt update && apt install -y libsqlite3-dev libxml2 libxslt1.1 libxslt1-dev \
  libpq5 libpq-dev libzmq1 curl wget sqlite3 git
RUN ln -s /usr/lib/x86_64-linux-gnu/libzmq.so.1 /usr/local/lib/libzmq.so
COPY gems /gems
COPY inotify /usr/local/lib/ruby/site_ruby/1.8/x86_64-linux/
RUN cd /gems && gem install --local --no-ri --no-rdoc \
	 rake -v 0.8.7 \
	 rails -v 2.3.3 \
	 sqlite3-ruby -v 1.2.4 \
	 actionmailer -v 2.3.3 \
	 actionpack -v 2.3.3 \
	 activerecord -v 2.3.3 \
	 capistrano -v 2.5.18 \
	 mongrel -v 1.1.5 \
	 nokogiri -v 1.5.0 \
	 passenger -v 4.0.40 \
	 spork-testunit -v 0.0.6 \
	 pg -v 0.14.1 \
	 ffi-rzmq -v 0.9.3 \
	 mocha -v 0.9.12 \
	 fastercsv -v 1.5.3 \
	 unittest-colorizer -v 0.1.0
CMD ["bash"]

