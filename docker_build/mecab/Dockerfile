FROM centos:centos7

RUN yum upgrade -y
RUN yum update -y
RUN yum install -y yum-utils gcc gcc-c++ git patch epel-release make curl xz file which

RUN rpm -ivh http://packages.groonga.org/centos/groonga-release-latest.noarch.rpm
RUN yum install -y perl-App-cpanminus
RUN cpanm autodie

WORKDIR /opt
RUN curl -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" -o mecab-0.996.tar.gz
RUN tar zxvf mecab-0.996.tar.gz
WORKDIR /opt/mecab-0.996
RUN ./configure --with-charset=utf8 --enable-utf8-only
RUN make
RUN make install

WORKDIR /opt
RUN curl -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" -o mecab-ipadic-2.7.0-20070801.tar.gz
RUN tar zxvf mecab-ipadic-2.7.0-20070801.tar.gz
WORKDIR /opt/mecab-ipadic-2.7.0-20070801
RUN ./configure --with-charset=utf8
RUN make
RUN make install

WORKDIR /opt
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
WORKDIR /opt/mecab-ipadic-neologd
RUN ./bin/install-mecab-ipadic-neologd -n -y --eliminate-redundant-entry

WORKDIR /opt
RUN zip -r neologd.zip neologd

CMD /bin/bash