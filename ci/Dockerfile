FROM adoptopenjdk/openjdk8:latest

RUN apt-get update && apt-get install -y wget

RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.0/spring-boot-cli-2.5.0-bin.tar.gz
RUN tar xvfz spring-boot-cli-2.5.0-bin.tar.gz
RUN cd /usr/local/bin && ln -s /spring-2.5.0/bin/spring .
