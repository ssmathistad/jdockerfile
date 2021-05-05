FROM centos:7
#WORKING DIRECTORY
WORKDIR /working_dir
#Install dependencies for Jenkins
RUN yum -y update \
    && yum -y install java-1.8.0-openjdk-devel \
    && yum -y install wget \
    && yum -y install git \
    $$ cd /working_dir \
    && wget https://get.jenkins.io/war-stable/2.263.2/jenkins.war \
    #Non-Privileged User
    && adduser appuser \
    && groupadd appgroup \
    && usermod -a -G appgroup appuser
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.275.b01-0.el7_9.x86_64
USER appuser
#Expose network
EXPOSE 8080
#Entry
ENTRYPOINT ["java", "-jar", "jenkins.war"]

# ---------- Build commands ----------
#       docker build /PATH/TO/DOCKERFILE -t j
#       docker run -it -p 8080:8080 j
# Accessible at http://localhost:8080/
