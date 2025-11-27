# Use lightweight Alpine Linux
FROM alpine:latest

# Copy hello.txt into container
COPY hello.txt /hello.txt

# Command to display the file
CMD ["cat", "/hello.txt"]
