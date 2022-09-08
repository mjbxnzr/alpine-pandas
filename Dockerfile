FROM python:3.9.14-alpine3.16

RUN apk --update add --no-cache g++

RUN pip install pandas