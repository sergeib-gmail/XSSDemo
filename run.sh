#!/bin/sh
for i in {1..4}
do
  docker run -itd -e CONTRAST__APPLICATION__NAME="SpringBoot$i" --name SpringBoot$i test/springboot:v1
done
sleep 5
for i in {1..4}
do
  docker exec SpringBoot$i apk add --no-cache curl
done
  sleep 50
for i in {1..4}
do
  docker exec SpringBoot$i curl http://localhost:8080/?name=Shraddha
done