FROM ubuntu:xenial

# Prerequisites
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  python-pip python3-pip \
  && rm -rf /var/lib/apt/lists/*

# Jupyter
# TODO ImportError: No module named jupyter_nbextensions_configurator
RUN pip3 install \
  jupyter \
  jupyter_contrib_nbextensions \
  jupyter_nbextensions_configurator \
  ipywidgets \
  && jupyter contrib nbextension install \
  && jupyter nbextensions_configurator enable \
  && jupyter nbextension enable --py widgetsnbextension --sys-prefix
EXPOSE 8888

# Python2 kernel
RUN pip install --upgrade pip \
  && python2 -m pip install --ignore-installed -U ipykernel \
  && python2 -m ipykernel install

# Python2 packages for notebooks
RUN pip install --upgrade \
  ipyvolume \
  matplotlib \
  pandas \
  trimesh
