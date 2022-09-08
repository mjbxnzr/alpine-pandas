# FROM python:3.9.14-alpine3.16

# # prerequisite before installing pandas
# RUN apk --update add --no-cache g++

# RUN pip install pandas


ARG WHEEL_DIST="/tmp/wheels"

FROM python:3.9.14-alpine3.16 as builder

ARG WHEEL_DIST

RUN apk --update add --no-cache g++

RUN echo "pandas==1.4.4" > /tmp/requirements.txt

RUN python3 -m pip wheel -w "${WHEEL_DIST}" -r /tmp/requirements.txt


FROM python:3.9.14-alpine3.16 

ARG WHEEL_DIST

COPY --from=builder "${WHEEL_DIST}" "${WHEEL_DIST}"

WORKDIR "${WHEEL_DIST}"

RUN pip3 --no-cache-dir install *.whl