# httpd-tomcat-log-custom


## 적용 내역
- [x] : tomcat log 저장을 호스트(pod 명) 기준의 폴더 하위에 생성
- [ ] : httpd log  저장을 호스트(pod 명) 기준의 폴더 하위에 생성, 인덱스 disable
- [x] : nginx 이용한 reverse proxy 생성 


## 환경 구성
```
├── README.md
├── httpd-homepage      홈페이지 예시 (httpd)
├── nginx-homepage      홈페이지 예시 (nginx)
├── tomcat-custom       tomcat 커스텀 빌드 (log 하위 호스트명 폴더에 로깅)
├── tomcat-helloworld   tomcat 커스텀 예제 
└── tomcat-homepage     홈페이지 예시 (tomcat)
```
## 실행 예시
```
$ docker ps | grep paasup
b3f705f22905   paasup/nginx-custom:homepage    "/docker-entrypoint.…"   9 minutes ago       Up 9 minutes                                                   nginx
fc1270f8670d   paasup/httpd-custom:homepage    "httpd-foreground"       41 minutes ago      Up 41 minutes      0.0.0.0:8081->80/tcp, :::8081->80/tcp       httpd
0cd9c70e6fcc   paasup/tomcat-custom:homepage   "catalina.sh run"        About an hour ago   Up About an hour   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   tomcat
```
