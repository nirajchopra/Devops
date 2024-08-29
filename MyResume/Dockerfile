# Use the official Tomcat 9 image as a base
FROM tomcat:9.0

# Copy the Resume.html file to the webapps directory of Tomcat
COPY myResume.html /usr/local/tomcat/webapps/ROOT/index.html

# Expose port 8080
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
