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
####### Stages by Nikhil

FROM tomcat:9.0-jdk11

WORKDIR /usr/local/tomcat/webapps

COPY . .
RUN ls
RUN pwd
COPY target/maven-wrapper.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080


# ----------- STAGE 1: Build WAR using Maven -----------
#FROM maven:3.9.6-eclipse-temurin-17 AS builder

#WORKDIR /usr/src/app
#COPY . .

# Build WAR without tests
#RUN mvn clean package -DskipTests


# ----------- STAGE 2: Run the App with Java -----------
#FROM openjdk:17.0.2

#WORKDIR /app

# Copy WAR file from builder stage
#COPY --from=builder /usr/src/app/target/*.war /app/app.war

#CMD ["java", "-jar", "/app/app.war"]


