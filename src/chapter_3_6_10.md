### 3.6.10 Opening File Descriptors for Reading and Writing

```sh
[n]<>word
```

이 연산자는 *word*를 전개하여 얻은 파일명을 사용해 읽고 쓰기가 가능하도록 파일을 열고 파일 디스크립터 *n*에 연결합니다. *n*이 지정되지 않았다면 파일 디스크립터 0을 연결합니다. 만약 파일이 존재하지 않는다면 만듭니다.
