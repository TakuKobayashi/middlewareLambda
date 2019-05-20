FROM centos:centos7

RUN yum upgrade -y
RUN yum update -y
RUN yum install -y yum-utils gcc gcc-c++ git epel-release make curl xz file which wget cmake libtool scl-utils centos-release-scl centos-release-scl-rh
RUN yum install -y devtoolset-7 llvm-toolset-7-cmake

WORKDIR /opt
RUN curl -L "https://github.com/ku-nlp/jumanpp/releases/download/v2.0.0-rc2/jumanpp-2.0.0-rc2.tar.xz" -o jumanpp-2.0.0-rc2.tar.gz
RUN tar xf jumanpp-2.0.0-rc2.tar.gz
WORKDIR /opt/jumanpp-2.0.0-rc2
# sclは一度ログアウトしちゃうと設定し直さないといけない。別のRUNにすると一度ログアウトして再度ログインした状態になる
RUN scl enable devtoolset-7 llvm-toolset-7 bash && cmake -DCMAKE_BUILD_TYPE=Release
RUN make
RUN make install

#CMD /bin/bash