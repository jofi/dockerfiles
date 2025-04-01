FROM python:3-alpine

RUN addgroup -S dev --gid 1000 && adduser -S dev -G dev --uid 1000
RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk add git-fast-import

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME=/home/dev
USER dev

ADD requirements.txt .
RUN pip install -r requirements.txt && \
    echo "Python version:" && python --version && \
    echo "Pip version:" && pip --version && \
    echo "Installed packages:" && pip list && \
    echo "Python path:" && python -c "import sys; print('\n'.join(sys.path))" && \
    echo "Contents of /usr/local/bin:" && ls -la /usr/local/bin
EXPOSE 8000

ENV PATH=/usr/local/bin:$PATH
CMD ["/bin/sh"]
