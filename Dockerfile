# Stage 1: Build the Spring Boot application (Maven)
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml first (for caching dependencies)
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build jar
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jre-focal

WORKDIR /app

# Copy jar from builder
COPY --from=builder /app/target/*.jar app.jar

# Expose port (IMPORTANT: Render uses dynamic port)
EXPOSE 8080

# Run app
ENTRYPOINT ["java", "-jar", "app.jar"]
