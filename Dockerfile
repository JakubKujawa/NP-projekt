FROM python:3.7-alpine
ENV PYTHONUNBUFFERED=1
RUN pip install --upgrade pip
WORKDIR /code
RUN apt-get update && apt-get install -y \
        python-dev python-pip python-setuptools \
        libffi-dev libxml2-dev libxslt1-dev \
        libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev \
        liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt
RUN pip install Pillow
COPY . .
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]