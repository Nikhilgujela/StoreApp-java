#
#    Copyright 2010-2023 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       https://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

# ----------------------------
# Stage 1: Build using Maven
# ----------------------------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy all project files into the container
COPY . .

# Package the application without running tests
RUN mvn clean package -DskipTests


# ----------------------------
# Stage 2: Run the built app
# ----------------------------
FROM openjdk:17.0.2

# Set working directory for runtime container
WORKDIR /app

# Copy only the WAR file from the builder stage
COPY --from=builder /usr/src/app/target/*.war /app/app.war

# Set the default command to run the app
CMD ["java", "-jar", "/app/app.war"]
