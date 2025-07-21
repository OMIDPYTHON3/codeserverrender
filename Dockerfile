FROM debian:bullseye

# نصب ابزارهای پایه
RUN apt update && apt install -y \
    curl \
    wget \
    sudo \
    git \
    bash \
    python3 \
    python3-pip \
    nano \
    ca-certificates \
    gnupg

# اضافه کردن یوزر عادی
RUN useradd -m coder && echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# نصب code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# ست کردن پورت
EXPOSE 8080

USER coder
WORKDIR /home/coder

# اجرای code-server در داخل bash تا ترمینال کامل باشه
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
