# Worker 노드 logrotate 설정

## 요구사항
- k8s 에 실행되는 https, tomcat pod 는 hostpath 이용하여 로그를 호스트 볼륨에 생성
- pod 실행 어플리케이션의 로그를 일자/시간 등 조건에 따라 로그를 나누고 압축 관리하도록 설정

## 구성
- logrotate는 centos 기본 제공 유틸임
- /etc/cron.daily/logrotate에 cron 등록되어 매일 실행됨
- 로테이션 룰은 /etc/logrotate.d 위치에 어플리케이션별 파일로 관리
- 수동 실행 방법
  전체 실행 :          /usr/sbin/logrotate /etc/logrotate.conf
  특정 룰만 실행 :  /usr/sbin/logrotate /etc/logrotate.d/kbstar
- 설정 예시
```
# cat /etc/logrotate.d/kbstar
/log/kbstar/*log {
    rotate 180
    copytruncate
    missingok
    notifempty
    compress
    maxsize 10M
    daily
    dateext
    dateformat -%Y%m%d-%H
    create 0644 root root
}
```
### 주요 설정 설명
- rotate 1000 : 로그 파일 갯수를 10000개로 유지 (10000개가 넘어가면 오래된 파일부터 삭제)
- create : 원본 파일이 roate되고, 원본 파일명으로 신규 파일이 생성 (비활성화 nocreate, 복사본을 만들려면 copy. copy 옵션을 사용할 경우 create 옵션이 적용되지 않음)
- daily : 일단위로 rotate (weekly, monthly, hourly 등 원하는 rotate 기간에 따라 설정)
- missingok : 로그 파일이 없는 경우에도 에러 없이 다음으로 넘어감 (nomissingok 가 default. 로그 없을 시 error 발생)
- dateext : test.log.1 test.log.2 처럼 숫자를 붙이는 대신 지정한(dateformat) 날짜 형태의 값으로 확장자를 생성
- dateformat : dateext 옵션과 함께 사용하며, 로그 파일이 rotate될 때, 어떤 형태로 확장자를 생성할지 설정 (test.log -> test.log-2021-07-31_00)
- maxage 14 : 14일 이상이 지난 로그 파일을 삭제
- maxsize 10M : 10M 이상이 된 로그 파일을 설정된 기간 조건과 관계없이 rotate


## 참고
- https://jinane.tistory.com/11
