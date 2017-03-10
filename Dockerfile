FROM debian:jessie

RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt install -y nodejs cron