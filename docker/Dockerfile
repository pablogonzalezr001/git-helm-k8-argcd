# Stage 1: Build the application
FROM eclipse-temurin:25-jdk-alpine AS builder
WORKDIR /app
COPY app/ai-service/gradlew .
COPY app/ai-service/gradle gradle
COPY app/ai-service/build.gradle .
COPY app/ai-service/src src

# Ensure gradlew has execution permissions
RUN chmod +x gradlew
# Compile the application (skip tests for faster build)
RUN ./gradlew build -x test

# Stage 2: Create the minimal runtime image
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/ai-service-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
