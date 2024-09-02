# Use the official Tomcat 9 image as the base
FROM tomcat:9.0

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps/ROOT

# Copy the Resume.html to the webapps directory of Tomcat
COPY MyResume.html ./index.html

# Expose the default Tomcat port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
