FROM codercom/code-server:latest

USER root

# نصب bash و sudo
RUN apt update && apt install -y bash sudo

# یوزر coder رو اضافه به sudoers کنیم که بتونه apt بزنه
RUN echo "coder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# بازگشت به یوزر code-server
USER coder

EXPOSE 8080

CMD ["code-server"]
