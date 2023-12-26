FROM debian:latest

ENV VERSION=0.4
ENV ARGS=

WORKDIR /app

RUN apt update && apt install wget -y
RUN wget -O /app/llamafile-server  https://github.com/Mozilla-Ocho/llamafile/releases/download/$VERSION/llamafile-server-$VERSION && chmod +x llamafile-server

EXPOSE 8080
ENTRYPOINT ["sh", "-c", "/app/llamafile-server --host 0.0.0.0 -m /app/model $ARGS"]