FROM python:3.10-bullseye

# Install nodejs 19 manually (optional step)
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - \
    && apt-get install -y nodejs

# Continue as normal
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg aria2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD bash start
