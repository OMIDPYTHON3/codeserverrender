FROM debian:bullseye

RUN apt update && apt install -y curl wget sudo git bash python3 python3-pip nano ca-certificates gnupg

# نصب code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

EXPOSE 8080

USER root

WORKDIR /root

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
