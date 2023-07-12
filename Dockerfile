FROM python:3.9.17-alpine3.18

RUN apk add --no-cache gcc musl-dev librdkafka-dev

WORKDIR /usr/src/mockintosh

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt

COPY setup.cfg .
COPY setup.py .
COPY README.md .
COPY mockintosh/ ./mockintosh/

RUN pip3 install .

