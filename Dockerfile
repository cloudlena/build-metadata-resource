FROM concourse/buildroot:base

COPY scripts/ /opt/resource/
RUN chmod +x /opt/resource/*
