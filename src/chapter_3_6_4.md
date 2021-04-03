### 3.6.4 Redirecting Standard Output and Standard Error

이 구조는 표준 출력(파일 디스크립터 1)과 표준 에러 출력(파일 디스크립터 2)를 모두 *word*의 전개로 얻은 파일명으로 재전송합니다.

표준 출력과 표준 에러를 재전송하는 형식은 두 가지가 있습니다.

```sh
&>word
```

와

```sh
>&word
```

입니다. 첫번째 형식이 일반적으로 선호됩니다. 이 구조는 다음과 동일합니다.

```sh
>word 2>&1
```

두번째 형식을 사용하면 *word*는 숫자나 '-'로 전개되지 않을 수 있습니다. 이 경우, 호환성 문제로 다른 리다이렉션 연산자가 적용됩니다([Duplicating File Descriptors](chapter_3_6_8.html)를 참조).
