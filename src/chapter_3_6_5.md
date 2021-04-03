### 3.6.5 Appending Standard Output and Standard Error

이 구조는 표준 출력(파일 디스크립터 1)과 표준 에러 출력(파일 디스크립터 2)를 모두 *word*의 전개로 얻은 파일에 추가하도록 재전송합니다.

표준 출력과 표준 에러를 추가하도록 재전송하는 형식은 다음과 같습니다.

```sh
&>>word
```

이는 다음과 동일합니다([Duplicating File Descriptors](chapter_3_6_8.html)를 참조).

```sh
>>word 2>&1
```
