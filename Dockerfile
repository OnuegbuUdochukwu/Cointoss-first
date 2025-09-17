# # Use an official OpenJDK runtime as a parent image
# FROM eclipse-temurin:17-jdk-alpine

# # Set the working directory
# WORKDIR /app

# # Copy the built jar from the target directory
# COPY --from=build /app/target/Cointoss-0.0.1-SNAPSHOT.jar .

# # Expose the port the app runs on
# EXPOSE 8080

# # Set environment variables (Render will override these as needed)
# ENV JAVA_OPTS=""

# # Run the jar file
# ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]


# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY . .
	RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/Cointoss-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENV JAVA_OPTS=""
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar Cointoss-0.0.1-SNAPSHOT.jar"]