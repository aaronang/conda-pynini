FROM continuumio/miniconda:4.8.2

RUN apt-get update \
    && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.6.8.tar.gz \
    && tar xf openfst-1.6.8.tar.gz \
    && (cd openfst-1.6.8; ./configure --enable-grm --prefix="/opt/conda"; make install) \
    && rm -rf openfst-1.6.8.tar.gz openfst-1.6.8

RUN wget https://github.com/google/re2/archive/2018-04-01.tar.gz \
    && tar xf 2018-04-01.tar.gz \
    && (cd re2-2018-04-01; make install prefix="" DESTDIR="/opt/conda") \
    && rm -rf 2018-04-01.tar.gz re2-2018-04-01

RUN wget http://www.openfst.org/twiki/pub/GRM/PyniniDownload/pynini-1.9.3.tar.gz \
    && tar xf pynini-1.9.3.tar.gz \
    && (cd pynini-1.9.3; CPATH="/opt/conda/include" python setup.py install) \
    && rm -rf pynini-1.9.3.tar.gz pynini-1.9.3
