### 3.6.2 Redirecting Output

출력 리다이렉션은 *word* 를 전개하여 얻은 이름을 사용하는 파일을 열고, 파일 디스크립터 *n*이 쓸 수 있도록 합니다. *n*이 지정되지 않았다면 표준 출력(파일 디스크립터 1)을 사용합니다. 대상 파일이 존재하지 않는다면 만듭니다. 만약 파일이 존재하는 경우 파일의 내용물을 지우고 빈 파일로 만듭니다.

출력 리다이렉션의 일반적인 형식은 다음과 같습니다.

```sh
[n]>[|]word
```

리다이렉션 연산자가 '>'이고 `set` 빌트인에서 `noclobber` 옵션을 켜고 있다면, *word*의 전개 결과로 얻은 파일명이 존재하고, 이 파일이 일반 파일이라면 리다이렉션이 실패합니다. 만약 리다이렉션 연산자가 '>|'이거나 '>'이고, `noclobber` 옵션이 꺼져있다면, `word`를 전개한 파일명이 존재하더라도 리다이렉션을 시도합니다.