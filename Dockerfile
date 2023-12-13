FROM amazoncorretto:21
WORKDIR /app
COPY target/arktos-joiner-0.0.1-SNAPSHOT.jar /app/arktos-joiner-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "arktos-joiner-0.0.1-SNAPSHOT.jar"]