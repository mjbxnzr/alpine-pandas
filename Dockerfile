FROM python:3.9.14-alpine3.16

# prerequisite before installing pandas
RUN apk --update add --no-cache g++

RUN pip install pandas
