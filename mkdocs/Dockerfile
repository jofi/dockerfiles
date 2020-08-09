FROM python:3-alpine

RUN addgroup -S dev --gid 1000 && adduser -S dev -G dev --uid 1000
RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk add git-fast-import

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME /home/dev
USER dev

ADD requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 8000
ENTRYPOINT ["mkdocs"]
CMD ["--help"]
