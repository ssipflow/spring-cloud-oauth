# OAuth Server 

## Spring Profile

- prd : 운영 환경 프로파일
- dev : 개발 환경 프로파일
- ide : 개발 모드 프로파일 

## RSA Key Generation

```sh
keytool -genkeypair \
       -alias msa \
       -keyalg RSA \
       -dname "CN=Auth,OU=,O=sicc,L=Seoul,S=Seoul,C=KR" \
       -keypass new1234! \
       -keystore msa.jks \
       -storepass new1234!
keytool -export -keystore ./msa.jks -alias msa -file msa.cer
openssl x509 -inform der -in ./msa.cer -pubkey -noout
```
