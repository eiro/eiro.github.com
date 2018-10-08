FROM debian:buster
ADD sympa-deps-control /tmp
RUN set -e ;\
    apt -y update;\
    apt -y upgrade;\
    apt -y install equivs;\
    cd /tmp;\
    equivs-build sympa-deps-control;\
    apt -y install ./*.deb;\
