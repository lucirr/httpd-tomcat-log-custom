
템플릿 변수
- $APPLICATION : 어플리케이션명 (homepage)
- $DOMAIN_NAME : 도메인명 (www.kbstarplatform.com/homepage)
- $DOCKER_IMAGE : 배포한 Docker 이미지 

was/tpl/Dockerfile.tpl 변경
- 예시와 같이 소스war 를 context path 에 맞게 복사
```
COPY sp-homePage.war /usr/local/tomcat/webapps/homepage.war
```
- Context Path 가 / 인 경우는 ROOT.war 로 복사
```
COPY mciApiServer.war /usr/local/tomcat/webapps/ROOT.war   
```

web/tpl/Dockerfile.tpl 변경
- 예시와 같이 소스 web 리소스를 context path 에 맞게 복사 (예시 context path 는 /static)
```
COPY ./static /usr/local/apache2/htdocs/static
```

템플릿 고정값 
- secret name : kbstarplatform 
- was/tpl/pv.tpl : 192.168.0.50
