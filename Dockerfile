# Use a base image with Tomcat 9 and Java 8 installed
FROM tomcat:9.0-jdk8-openjdk

# Copy the WAR file to the Tomcat's webapps directory
COPY target/DemoCOMP367.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
