FROM nginx:alpine
COPY hello.txt /usr/share/nginx/html/index.html
EXPOSE 3000
