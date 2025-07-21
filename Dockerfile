FROM codercom/code-server:latest

USER root

RUN apt update && apt install -y git curl python3 python3-pip nano

# اختیاری: اضافه کردن افزونه‌های VS Code
RUN code-server --install-extension ms-python.python

# برگردوندن یوزر به حالت اصلی
USER coder
