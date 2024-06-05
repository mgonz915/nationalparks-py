FROM centos/python-36-centos7:latest
RUN pip install --upgrade pip
WORKDIR /usr/src/app
COPY . .
RUN pip install .


USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble

CMD [ "/usr/libexec/s2i/run" ]
