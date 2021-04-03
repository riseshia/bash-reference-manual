## 3.6 Redirections
셸에서는 특수한 표기 방식을 사용하여 명령어를 실행하기 전에 해당 명령어의 입력과 출력을 어디로 *리다이렉트*할 지 지정할 수 있습니다. 명령어는 리다이렉션을 이용해 파일 핸들을 복제, 열기, 닫기, 다른 파일에 대한 참조 만들기 그리고 명령어가 읽고 쓸 파일을 변경할 수 있습니다. 또한 리다이렉션은 현재 셸 실행 환경의 파일 핸들을 변경하기 위해서 사용할 수 있습니다. 다음의 리다이렉션 연산자는 앞에 두거나, 뒤에 두거나, 단순한 명령이라면 임의의 위치에 둘 수 있습니다. 리디렉션은 나타나는 순서대로 왼쪽에서 오른쪽으로 처리됩니다. 

파일 디스크립터 숫자가 앞에 올 수 있는 각 리다이렉션은 그 대신에 {*varname*}와 같은 형식으로 앞에 둘 수 있습니다. 이 경우, 셸은 `>&-`와 `<&-`를 제외한 각 리다이렉션 연산자에 10보다 큰 파일 디스크립터를 준비하고, 이를 {*varname*}에 대입합니다. 만약 {*varname*} 이 `>&-`와 `<&-` 앞에 오는 경우, *varname*의 값은 닫을 파일 디스크립터를 정의합니다. 만약 {*varname*}이 있다면, 리다이렉션은 셸 프로그래머가 파일 디스크립터의 생애주기를 직접 관리할 수 있도록 명령어의 스코프를 무시하고 *varname*을 유지합니다.

이후의 설명에서 파일 디스크립터의 숫자가 생략되고 리다이렉션 연산자의 첫글자가 '<'라면, 리다이렉션은 표준 출력(파일 디스크립터 0)을 참조하며, 리다이렉션 연산자의 첫번째 글자가 '>'라면 리다이렉션은 표준 출력(파일 디스크립터 1)을 참조합니다.

이후의 설명에서 리다이렉션 연산자 뒤에 오는 단어는 별도의 설명이 없는 한, 중괄호 전개, 물결줄표 전개, 매개변수 전개, 명령어 치환, 산술 전개, 따옴표 제거, 파일명 전개, 단어 분리가 적용됩니다. 만약 전개 결과가 2개 이상의 단어라면 Bash는 에러를 보고합니다.

리다이렉션의 순서에는 중요한 의미가 있습니다. 예를 들어, 다음 명령어는 표준 출력(파일 디스크립터 1)과 표준 에러(파일 디스크립터 2)를 모두 *dirlist*라는 파일로 전송합니다.

```sh
ls > dirlist 2>&1
```

반면 다음 명령어는 표준 출력이 *dirlist*로 전송하도록 설정하기 전의 표준 출력의 사본으로부터 표준 에러가 만들어지기 때문에 원래의 표준 출력만을 *dirlist*로 전송합니다.

```sh
ls 2>&1 > dirlist
```

Bash는 다음 테이블에서 설명하는 몇몇 파일명을 리다이렉션에서 사용될 때 특별취급합니다. 만약 Bash가 동작하고 있는 운영체제가 이 특별한 파일들을 제공한다면 Bash는 그것들을 사용합니다. 만약 존재하지 않는다면 아래에서 설명된 행동을 내부에서 에뮬레이트합니다.

- **/dev/fd/*fd***

  *fd*가 유효한 정수라면, 파일 디스크립터 *fd*를 복사합니다.
- **/dev/stdin**

  파일 디스크립터 0을 복사합니다.
- **/dev/stdout**

  파일 디스크립터 1을 복사합니다.
- **/dev/stderr**

  파일 디스크립터 2를 복사합니다.
- **/dev/tcp/*host*/*port***

  *host*가 유효한 호스트 이름이거나, 인터넷 주소이고, *port*가 포트 번호를 가리키는 정수이거나 서비스 이름이면, Bash는 그에 대응하는 TCP 소켓을 열려고 시도합니다.
- **/dev/udp/*host*/*port***

  *host*가 유효한 호스트 이름이거나, 인터넷 주소이고, *port*가 포트 번호를 가리키는 정수이거나 서비스 이름이면, Bash는 그에 대응하는 UDP 소켓을 열려고 시도합니다.

파일을 열거나 만들 수 없는 경우 리다이렉션은 실패합니다.

9보다 큰 파일 디스크립터를 사용하는 리다이렉션을 사용할 때는 셸이 내부에서 사용하는 파일 디스크립터와 충돌할 가능성이 있으므로 조심해야 합니다.