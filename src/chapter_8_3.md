## 8.3 Readline Init File
Readline 라이브러리는 기본으로 설치되는 Emacs와 유사한 키 바인딩 집합과 동작함에도 불고하고 다른 키 바인딩 집합을 사용할 수도 있습니다. 유저는 명령어를 (관습적으로 홈 디렉터리에 존재하는) *inputrc* 파일에 추가하는 것으로 프로그램이 Readline을 사용하도록 커스터마이징할 수 있습니다. 이 파일의 이름은 셸 변수 `INPUTRC`로부터 얻습니다. 해당 변수가 설정되어있지 않다면, 기본값은 `~/.inputrc`입니다. 파일이 존재하지 않거나 읽을 수 없다면 최종 기본값은 `/etc/inputrc`입니다. `bind` 빌트인 명령어로 Readline 키 바인딩과 변수를 설정할 수 있습니다. Bash Builtins를 참조하세요.

Readline 라이브러리를 사용하는 프로그램이 시작할 때, 초기화 파일을 읽고 키 바인딩이 설정됩니다.

그리고 `C-x C-r` 명령어로 이 초기화 파일을 다시 읽을 수 있으므로, 변경을 바로 반영할 수 있습니다.

- [Readline Init File Syntax](chapter_8_3_1.html) : inputrc 파일에서의 명령어 문법.
- [Conditional Init Constructs](chapter_8_3_2.html) : inputrc 파일에서의 조건부 키 바인딩.
- [Sample Init File](chapter_8_3_3.html) : inputrc 파일 예제.
