FROM jetbrains/teamcity-agent:2018.2

COPY packages-microsoft-prod.deb /packages-microsoft-prod.deb
RUN dpkg -i /packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell zip git-lfs && \
    apt-get clean all && \
    pwsh -command "Install-Module AWSPowerShell.NetCore -Force"
