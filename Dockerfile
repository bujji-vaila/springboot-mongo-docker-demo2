FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install


FROM openjdk:8
WORKDIR /app
COPY --from=build /app/target/springboost-mongodb-docker.jar /app/springboost-mongodb-docker.jar
EXPOSE 8080
ENTRYPOINT [ "jar","-jar", "springboost-mongodb-docker.jar" ]