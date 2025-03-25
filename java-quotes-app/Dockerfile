# Base image
FROM openjdk:17-jdk-alpine

# Working dir for application inside container.
WORKDIR /app

# Copy source code from local to inside contains workdir.
COPY src/Main.java /app/Main.java
COPY quotes.txt /app/quotes.txt

RUN javac Main.java

# As per developer, this application is running on port 8000 so we need to expose the same port.
EXPOSE 8000

# To execute the java file contineously use CMD.

CMD [ "java" , "Main" ]
