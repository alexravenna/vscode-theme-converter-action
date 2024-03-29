# Container image that runs your code
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY theme.json /theme.json
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
