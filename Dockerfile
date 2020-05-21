FROM continuumio/miniconda3:4.8.2

RUN apt-get update
RUN apt-get install -y build-essential git

RUN wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.6.8.tar.gz
RUN tar xf openfst-1.6.8.tar.gz;
RUN (cd openfst-1.6.8; ./configure --enable-grm --prefix="/opt/conda"; make install)

RUN git clone https://github.com/google/re2
RUN (cd re2; git checkout 2018-04-01; make install prefix="" DESTDIR="/opt/conda")

RUN wget http://www.openfst.org/twiki/pub/GRM/PyniniDownload/pynini-1.9.3.tar.gz
RUN tar xf pynini-1.9.3.tar.gz
RUN (cd pynini-1.9.3; CPATH="/opt/conda/include" python setup.py install)
