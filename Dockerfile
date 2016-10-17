FROM cern/cc7-base

USER root


COPY provisioning /root/provisioning
RUN provisioning/system-setup-centos.sh
RUN provisioning/install-sw.sh

#EXPOSE 8888

#CMD /bin/bash
