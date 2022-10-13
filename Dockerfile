FROM ubuntu

RUN apt update

RUN apt install -y \
    python3 \
    socat

RUN useradd -d /home/ctf/ -m -p ctf -s /bin/bash ctf
RUN echo "ctf:ctf" | chpasswd

WORKDIR /home/ctf

COPY source .

USER ctf

CMD socat TCP-LISTEN:6666,fork,reuseaddr EXEC:'python3 dh.py'