FROM openjdk:17-slim

# Install Kotlin
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -o kotlin.zip -L https://github.com/JetBrains/kotlin/releases/download/v1.8.0/kotlin-compiler-1.8.0.zip && \
    unzip kotlin.zip -d /opt && \
    rm kotlin.zip && \
    apt-get remove -y curl unzip && \
    apt-get clean

ENV PATH=$PATH:/opt/kotlinc/bin

WORKDIR /app

# Copy application files
COPY . .

# Compile Kotlin files
RUN kotlinc src/main/kotlin -include-runtime -d app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]

