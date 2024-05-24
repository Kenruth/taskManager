FROM python:3.9-slim-bullseye


# Perfomance
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 1

RUN apt-get update

#clean
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD ["gunicorn", "taskManager.wsgi:application", "--bind", "0.0.0.0:8000"]


