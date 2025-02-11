FROM openjdk:17-slim

WORKDIR /app

# Copy the application files
COPY . .

# Build the application (assuming Maven build)
RUN ./mvnw package -DskipTests

# Run the application (adjust the jar filename as needed)
CMD ["java", "-jar", "target/application.jar"]

