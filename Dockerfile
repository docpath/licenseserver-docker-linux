FROM openjdk:8

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y lib32stdc++6 gcc-multilib procps
RUN mkdir /required_files
COPY licenseservicepack-6.9.1.0-java.jar /required_files/
WORKDIR /required_files
RUN java -jar licenseservicepack-6.X.Y.Z-java.jar -solname"DocPath License Server" -install -console -silentmode -licserverpath"/usr/local/docpath/licenseserver" -licserverport1765
RUN rm -rf /required_files
VOLUME /usr/local/docpath/Licenses
EXPOSE 1765
WORKDIR "/usr/local/docpath/licenseserver/licenseserver/Bin"

ENTRYPOINT ["java", "-jar", "dplicenseserver.jar", "-start"]

