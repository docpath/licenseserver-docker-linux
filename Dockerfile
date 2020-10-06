FROM openjdk:8

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y lib32stdc++6 gcc-multilib procps
RUN mkdir /required_files
COPY licenseservicepack-6.x.y.z-java.jar /required_files/
WORKDIR /required_files
RUN java -jar licenseservicepack-6.x.y.z-java.jar -solname"DocPath License Server" -install -console -silentmode -licserverpath"/usr/local/docpath/licenseserver" -licserverport1765
RUN rm -rf /required_files
COPY run.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run.sh
VOLUME /usr/local/docpath/Licenses
EXPOSE 1765

ENTRYPOINT ["/usr/local/bin/run.sh"]
