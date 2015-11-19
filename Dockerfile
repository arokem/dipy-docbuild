FROM ubuntu:14.04
MAINTAINER Ariel Rokem <arokem@gmail.com>
# Install sklearn, in case you want to run SFM with ElasticNet:
RUN apt-get update && apt-get install -y python-sklearn \
python-dipy \
python-pip \
git \
python-cvxopt \
Xvfb \
python-vtk \
texlive-latex-recommended \
texlive-latex-extra \
texlive-fonts-recommended
RUN pip install --upgrade dipy
RUN pip install cython
RUN pip install sphinx
RUN pip install xvfbwrapper
ENV TEST_WITH_XVFB=true
CMD git clone https://github.com/nipy/dipy.git && cd dipy && python setup.py install && cd doc && make upload
