FROM python:3.9-slim-buster
ENV PYTHONUNBUFFERED=1
EXPOSE 8000
WORKDIR /code
COPY requirements.txt /code/
RUN apt-get update && apt-get install -y \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install -r requirements.txt
COPY ./core/ /code/