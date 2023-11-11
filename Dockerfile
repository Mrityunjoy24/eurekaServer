FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/target/eurekaRegistry.jar .
CMD ["java", "-jar", "eurekaRegistry.jar"]
