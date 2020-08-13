FROM gradle:6.1.1-jdk11
EXPOSE 8080

RUN apt update && apt install -y sysstat iputils-ping

WORKDIR /app/
COPY ./build/libs/ext/*.jar ./prison/libs/
COPY ./build/libs/*.jar ./prison/
COPY ./build/resources/main ./prison/config

WORKDIR /app/prison
CMD java $JAVA_ARGS -Dvertx.logger-delegate-factory-class-name=io.vertx.core.logging.Log4j2LogDelegateFactory -cp './*:./libs/*' vn.tiki.prison.PrisonApp
