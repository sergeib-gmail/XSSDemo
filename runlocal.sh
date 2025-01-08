#!/bin/sh
for i in {1..2}
do
  docker run -itd -e CONTRAST__APPLICATION__NAME="springboot" --name SpringBootProtect$i shraddha/springbootdisableprotect
done
sleep 5
for i in {1..2}
do
  docker exec SpringBootProtect$i apk add --no-cache curl
done
  sleep 50
for i in {1..2}
do
  docker exec SpringBootProtect$i curl http://localhost:8080/?name=Shraddha
done