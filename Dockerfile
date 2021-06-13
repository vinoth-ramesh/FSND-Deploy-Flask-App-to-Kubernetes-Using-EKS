#pull base image
FROM python:stretch

# set work directory
COPY . /app
WORKDIR /app

# install dependencies
COPY ./requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]