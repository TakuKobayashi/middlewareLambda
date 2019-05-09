FROM centos:centos7

RUN yum upgrade -y
RUN yum update -y
RUN yum install -y yum-utils gcc gcc-c++ git epel-release make curl xz file which wget cmake

WORKDIR /opt
RUN wget https://sourceforge.net/projects/boost/files/boost/1.62.0/boost_1_62_0.tar.gz
RUN tar xvzf boost_1_62_0.tar.gz
WORKDIR /opt/boost_1_62_0
RUN sh bootstrap.sh
RUN ./b2 install -j2

#WORKDIR /opt
#RUN wget https://cmake.org/files/v3.14/cmake-3.14.3.tar.gz
#RUN tar zxvf cmake-3.14.3.tar.gz
#WORKDIR /opt/cmake-3.14.3
#RUN ./bootstrap --no-system-libs
#RUN make
#RUN make install

WORKDIR /opt
RUN curl -L "https://github.com/ku-nlp/jumanpp/releases/download/v2.0.0-rc2/jumanpp-2.0.0-rc2.tar.xz" -o jumanpp-2.0.0-rc2.tar.gz
RUN tar xf jumanpp-2.0.0-rc2.tar.gz
WORKDIR /opt/jumanpp-2.0.0-rc2
RUN cmake -DCMAKE_BUILD_TYPE=Release
RUN make install -j

#CMD /bin/bash