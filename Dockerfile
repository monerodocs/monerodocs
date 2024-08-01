FROM python:3.9-slim AS builder

WORKDIR /md

COPY . /md

RUN pip install mkdocs mkdocs-material mkdocs-minify-plugin

RUN mkdocs build

FROM nginx:alpine

COPY --from=builder /md/docs /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
