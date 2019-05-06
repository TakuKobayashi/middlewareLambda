FROM centos:centos7

RUN yum upgrade -y
RUN yum update -y
RUN yum install -y yum-utils gcc gcc-c++ git patch epel-release

WORKDIR /tmp

RUN rpm -ivh http://packages.groonga.org/centos/groonga-release-latest.noarch.rpm
RUN yum install -y perl-App-cpanminus
RUN cpanm autodie

RUN mkdir /tmp/mecab-service
RUN curl -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" -o mecab-0.996.tar.gz
RUN tar zxvf mecab-0.996.tar.gz
RUN cd mecab-0.996
RUN ./configure --prefix=/tmp/mecab-service/local --enable-utf8-only
RUN make
RUN make install
RUN cd ..

RUN curl -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" -o mecab-ipadic-2.7.0-20070801.tar.gz
RUN tar zxvf mecab-ipadic-2.7.0-20070801.tar.gz
RUN cd mecab-ipadic-2.7.0-20070801
RUN export PATH=/tmp/mecab-service/local/bin:$PATH
RUN export LD_LIBRARY_PATH=/tmp/mecab-service/local/lib:$LD_LIBRARY_PATH
RUN ./configure --prefix=/tmp/mecab-service/local --enable-utf8-only --with-charset=utf8
RUN make
RUN make install
RUN cd ..

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN cd mecab-ipadic-neologd
RUN ./bin/install-mecab-ipadic-neologd -y -p /tmp/neologd -n --eliminate-redundant-entry
RUN cd ..

RUN zip -r mecab-service/neologd.zip neologd
RUN zip -r ~/mecab-service.zip mecab-service

CMD /bin/bash