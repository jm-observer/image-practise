FROM scratch
#FROM curlimages/curl:latest
COPY target/debug/hi /
#USER root
#RUN echo $HOME
#RUN mkdir src
#RUN curl -o /ab.sh --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs
#RUN curl http://www.baidu.com
#RUN ls -al /src/ab.sh
CMD /hi