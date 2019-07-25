FROM ubuntu:disco

# Jupyter
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  jupyter \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install \
  jupyter_contrib_nbextensions \
  jupyter_nbextensions_configurator \
  ipywidgets \
  && jupyter contrib nbextension install \
  && jupyter nbextensions_configurator enable \
  && jupyter nbextension enable --py widgetsnbextension --sys-prefix
EXPOSE 8888

# Setup default extensions
COPY notebook.json /root/.jupyter/nbconfig/

