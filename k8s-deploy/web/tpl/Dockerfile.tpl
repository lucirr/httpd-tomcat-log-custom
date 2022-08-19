FROM httpd:2.4.54

COPY log*.pl /usr/local/apache2/bin/
COPY httpd.conf /usr/local/apache2/conf/

# Copy source resources into web home dir with context path name (ex. static)  
# COPY ./static /usr/local/apache2/htdocs/static
