### 3.6.7 Here Strings

히어독의 변형입니다. 형식은 다음과 같습니다.

```sh
[n]<<< word
```

*word*에는 물결줄표 전개, 매개변수와 변수 전개, 명령어 치환, 산술 치환, 따옴표 제거가 적용됩니다. 파일명 전개와 단어 분리는 발생하지 않습니다. 전개 결과는 마지막에 개행이 추가된 단일 문자열이 되며, 명령어의 표준 입력(파일 디스크립터 *n*이 지정되어 있다면 *n*)으로 이용됩니다.