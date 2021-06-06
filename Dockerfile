FROM python:3.7-alpine
ENV PYTHONUNBUFFERED=1
RUN pip install --upgrade pip
WORKDIR /code
RUN apk update && apk add alpine-sdk gcc musl-dev python3-dev libffi-dev openssl-dev
RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers && pip install Pillow
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apk del .tmp
COPY . .
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
