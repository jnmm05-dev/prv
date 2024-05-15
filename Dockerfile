# Use the official Jupyter Notebook image as the base image
FROM jupyter/minimal-notebook

USER root

# Install dependencies required for Firefox
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fonts-liberation \
        libasound2 \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgbm1 \
        libgcc1 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libx11-6 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        lsb-release \
        tor \
        flatpak \
        snapd \
        build-essential \
        wget && \
    



# Download the Firefox deb package
# Replace the URL below with the actual URL of the Firefox deb package you wish to install
RUN wget -O firefox.deb "http://http.us.debian.org/debian/pool/main/f/firefox/firefox_126.0-1_amd64.deb"

# Install Firefox from the deb package
RUN dpkg -i firefox.deb

# Fix dependencies if there are any issues
RUN apt-get install -fy

# Clean up
RUN rm -rf /var/lib/apt/lists/*
RUN rm firefox.deb
