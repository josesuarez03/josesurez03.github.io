FROM python:3.12.1

LABEL maintainer="jose"


COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

WORKDIR /app

COPY . .

RUN python -m mkdocs build

FROM nginx:latest

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY default.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
