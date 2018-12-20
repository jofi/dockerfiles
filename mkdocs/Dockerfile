FROM python:3-alpine

ADD requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8000
RUN addgroup -S dev --gid 1000 && adduser -S dev -G dev --uid 1000

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME /home/dev
USER dev

ENTRYPOINT ["mkdocs"]
CMD ["--help"]
