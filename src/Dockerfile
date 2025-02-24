# syntax=docker/dockerfile:1

FROM python:3.11

WORKDIR /code

COPY . .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 50505

CMD ["gunicorn", "api.main:create_app()"]
