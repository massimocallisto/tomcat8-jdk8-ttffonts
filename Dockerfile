FROM tomcat:8.5.47-jdk8-openjdk

# https://github.com/CenterForOpenScience/docker-library/blob/master/unoconv/Dockerfile

# TODO: to check if we require all the packages
#RUN apt-get update \
#    # -slim images strip man dirs, but java won't install unless this dir exists.
#    && mkdir -p /usr/share/man/man1 \
#    && apt-get install -y \
#        git \
#        imagemagick \
#        libreoffice-script-provider-python \
#        libreoffice \
#    && apt-get clean \
#    && apt-get autoremove -y \
#    && rm -rf /var/lib/apt/lists/* \
#    && pip install unoconv==0.8.2
# additional fonts
RUN echo "deb http://httpredir.debian.org/debian buster main contrib non-free" > /etc/apt/sources.list \
    && echo "deb http://httpredir.debian.org/debian buster-updates main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y \
        fonts-arphic-ukai \
        fonts-arphic-uming \
        fonts-ipafont-mincho \
        fonts-ipafont-gothic \
        fonts-unfonts-core \
        ttf-wqy-zenhei \
        ttf-mscorefonts-installer \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["catalina.sh", "run"]
