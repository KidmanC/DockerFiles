FROM rust:1-slim

WORKDIR /app

# Copy Cargo files first for better layer caching
COPY Cargo.toml Cargo.lock ./

# Create a dummy main.rs to build dependencies
RUN mkdir src && \
    echo "fn main() {println!(\"dummy\")}" > src/main.rs && \
    cargo build --release && \
    rm -rf src

# Copy the actual source code
COPY src src

# Build the application
RUN cargo build --release

# Run the application
CMD ["./target/release/app"]

