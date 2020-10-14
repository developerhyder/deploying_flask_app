FROM python:3.7

WORKDIR /

ADD requirements.txt /

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./app /app

WORKDIR /app/app

CMD ["gunicorn", "--bind", "0.0.0.0:80", "--workers", "2", "--threads", "4", "--worker-class", "gthread", "main:app"]