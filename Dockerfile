# Use the official Jupyter Notebook image as the base image
FROM jupyter/minimal-notebook

# Switch to root user
USER root

# Install dependencies required for Firefox
RUN apt-get update && \
    apt-get upgrade -y && \
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
        wget \
        firefox \
        

# Install the desired Flatpak app, e.g., Firefox
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak update && \
    
    

# Switch back to the default user
USER $NB_UID

# Set environment variables for JupyterLab
ENV JUPYTER_ENABLE_LAB=yes

# Expose the default Jupyter notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["start-notebook.sh"]
