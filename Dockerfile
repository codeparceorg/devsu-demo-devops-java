FROM maven:3-eclipse-temurin-17 AS builder

WORKDIR /build

COPY pom.xml .
RUN mvn -q dependency:go-offline

COPY src ./src

RUN mvn -q -DskipTests=true clean package

# ================================================
# 2️⃣ RUNTIME STAGE  - minimal runtime image
# ================================================
# Use the slim JRE image to reduce footprint.
# The image is based on Debian/Alpine? Use Debian slim for compatibility.
FROM eclipse-temurin:17-jre-alpine AS runtime

# Create a non-root user and group with uid 1000, gid 1000.
# This follows the Docker best‑practice of running containers as
# non‑root whenever possible.
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Switch to the non‑root user.
USER appuser

# Set the working directory for the app.
WORKDIR /app

# Copy only the JAR from the builder stage.
COPY --from=builder /build/target/*.jar app.jar

# Expose the application port.
EXPOSE 8000

# Define a HEALTHCHECK to probe the /api/users endpoint.
# The success status code 200 indicates the Spring Boot app is up.
# If the endpoint is not present, the command will fail causing a
# container restart if configured.
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost:8000/api/users || exit 1

# Run the application.
ENTRYPOINT ["java", "-jar", "app.jar"]
