# StoreApp-java

A sample Java web application packaged as a WAR and deployed on Tomcat using Docker.

---

## 🧰 Prerequisites

Make sure you have the following installed:

- [Git](https://git-scm.com/)
- [Java 17](https://adoptium.net/)
- [Maven](https://maven.apache.org/)
- [Docker](https://www.docker.com/)

---

## 🚀 Step-by-Step Setup

### 🔹 Step 1: Clone the Repository

bash
git clone https://github.com/Nikhilgujela/StoreApp-java.git
cd StoreApp-java
🔹 Step 2: Modify Project Configuration

✅ 2.1 Update pom.xml to Package as WAR
Open pom.xml and change:

<packaging>jar</packaging>
to:

<packaging>war</packaging>

✅ 2.2 Allow Docker to Access the WAR File
Edit .dockerignore and remove or comment out the following line:


target/
🔹 Step 3: Install Java 17 Runtime :
sudo apt update
sudo apt install openjdk-17-jre-headless
sudo update-alternatives --config java
Choose Java 17 when prompted.

🔹 Step 4: Build the Project with Maven

mvn clean package -DskipTests -Dlicense.skip=true
This creates the WAR file in the target/ folder.

🔹 Step 5: Create the Dockerfile
Create a file named Dockerfile in the project root with the following content:

Dockerfile

# ----------- Use Tomcat to Run the App -----------
FROM tomcat:9.0-jdk11

WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file into the ROOT context
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

🔹 Step 6: Build the Docker Image
docker build -t storeapp-java .

🔹 Step 7: Run the Docker Container
docker run -p 8080:8080 storeapp-java

Visit: http://localhost:8080


