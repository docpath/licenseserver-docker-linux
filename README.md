# Docker Configuration Files for DocPath License Server

This is a complete example about how to deploy DocPath ® License Server in Linux using Docker. The example must be completed with the following files in the same directory as the repositorized files:

- `licenseservicepack-6.X.Y.Z-java.jar`: DocPath ® License Server Installer.
 
## Steps 
To successfully perform the example follow the steps as indicated below:
- Use the `openjdk:8` image. This is a Linux Debian image with OpenJDK 8 pre-installed.
- Install DocPath ® License Server.
- Copy the license file into the image.
- Use a custom port (by default 1765) to receive license requests.
- Deploys DocPath ® License Server.

## Necessary changes
- Change the `licenseservicepack-6.X.Y.Z-java.jar` with the corresponding version of DocPath ® License Server.

## How to build and deploy
Now we are going to build the container by executing the following sentence in the same directory where the dockerfile file is located:

`docker build -t docpath/licenseserver .`

**IMPORTANT!** the full stop at the end indicates the directory where the container is located. This is mandatory.

Run the container once it has been built, using the following sentence:

`docker run --name licenseserver --detach -p $PORT:1765 -v $LICENSEDIR:/usr/local/docpath/Licenses docpath/licenseserver`

The used parameters are:
- `--name`: this parameter indicates the name of the container, in this case licenseserver.
- `--detach`: this parameter indicates that no messages are displayed in the execution console, silent mode.

Replace:
- `$PORT`: With the port used in the host to redirect to the port 1765 of the container.
- `$LICENSEDIR`: Licenses folder in the host what will be linked with the specified folder in the container.

Example:

`docker run --name licenseserver --detach -p 1765:1765 -v /home/mainuser/docpathlicenses:/usr/local/docpath/Licenses docpath/licenseserver` 

