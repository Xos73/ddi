Command to make docker image from github:


docker build --tag=ddi_gui https://github.com/Xos73/ddi.git#master:ddi_gui && \
docker run -d -p 222:22/tcp ddi_gui
