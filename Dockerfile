FROM eclipse-temurin:17-jre-alpine AS runtime

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

RUN mkdir -p /app/db && chown -R appuser:appgroup /app

USER appuser

WORKDIR /app

COPY ./target/*.jar app.jar

EXPOSE 8000

# HEALTHCHECK 
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost:8000/api/users || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
