FROM alpine
ADD ./ /hello-world
RUN chmod -R 755 /hello-world/runapp
RUN chmod -R 755 /hello-world/*
WORKDIR /hello-world
CMD [ "./runapp" ]