FROM ubuntu:20.04
LABEL maintainer="raul1991de@gmail.com"
LABEL version="0.1"
LABEL description="Test"
RUN apt-get update && apt-get install -y