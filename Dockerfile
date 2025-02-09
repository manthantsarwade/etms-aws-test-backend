# Build Stage: Use Maven to build the JAR file
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
# Copy pom.xml and source code into the container
COPY pom.xml .
COPY src/ src/
# Build the project; this will create the JAR file in the target folder and skip tests
RUN mvn clean package -DskipTests

# Run Stage: Use a lightweight JDK image
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copy the JAR file from the build stage into the container
COPY --from=build /app/target/*.jar app.jar

# Create the upload directory and set the environment variable
RUN mkdir -p /app/files
ENV UPLOAD_DIR="/app/files"

# Expose the port that your Spring Boot app uses (adjust if needed)
EXPOSE 8080

# Start the application
CMD ["java", "-jar", "app.jar"]
