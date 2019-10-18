FROM bash:latest
LABEL Description="Alpine Test"
RUN apk update
RUN apk add --purge nmap && apk --purge add iptraf-ng && apk --purge add mc
RUN printf "alias la='ls -la --color'\nalias lf='ls -lh -d */'\nalias lh='ls -lah --color'\nalias ls='ls --color'\nalias ll='ls -l --color'\n" >> /etc/profile
RUN sed -i '/PS1/d' /etc/profile
RUN echo "export PS1='\e[1;34m[\e[m\u@\h\e[1;34m]\e[m \w\\$'" >> /etc/profile
RUN echo "source /etc/profile" > /root/.bashrc
