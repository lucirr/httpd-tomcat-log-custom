# httpd-tomcat-log-custom


## 적용 내역
- [x] : tomcat log 저장을 호스트(pod 명) 기준의 폴더 하위에 생성
- [x] : httpd log  저장을 호스트(pod 명) 기준의 폴더 하위에 생성, 인덱스 disable
- [x] : nginx 이용한 reverse proxy 생성 
- [x] : k8s 배포 (deployment, hostpath log volume)
- [x] : k8s 배포 노드 logratate

## 환경 구성
```
                    .-------.
             .------| Nginx |------.
             |      '-------'      |
             |                     |
             v                     v
         .-------.            .--------.
         | httpd |            | tomcat |
         '-------'            '--------'
```
## 디렉토리 구성
```
├── README.md
├── httpd-homepage      홈페이지 예시 (httpd)
├── k8s-deploy          k8s 배포 
├── nginx-homepage      홈페이지 예시 (nginx)
├── tomcat-custom       tomcat 커스텀 빌드 (log 하위 호스트명 폴더에 로깅)
├── tomcat-helloworld   tomcat 커스텀 예제 
└── tomcat-homepage     홈페이지 예시 (tomcat)
```

## 실행 예시
```
$ docker ps | grep paasup
25ab96db27dc   paasup/poc:nginx-custom-homepage    "/docker-entrypoint.…"   About a minute ago   Up About a minute                                               nginx
1dec3b653151   paasup/poc:tomcat-custom-homepage   "catalina.sh run"        11 hours ago         Up 11 hours         0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   tomcat
5719d93aaf67   paasup/poc:httpd-homepage           "httpd-foreground"       12 hours ago         Up 12 hours         0.0.0.0:8081->80/tcp, :::8081->80/tcp       httpd
```
