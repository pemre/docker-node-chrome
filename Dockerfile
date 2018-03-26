FROM ubuntu

# Curl & Xvfb
RUN apt-get update && apt-get install -y curl xvfb g++ build-essential

# Node
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

# Google Chrome
RUN curl -s https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list

# Install Chrome & Node
RUN apt-get update && apt-get install -y google-chrome-stable nodejs

# Run Xvfb
RUN Xvfb :0 -ac -screen 0 1280x800x24 &
