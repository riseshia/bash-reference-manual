### 6.3.3 Interactive Shell Behavior
셸이 인터랙티브 모드에서 동작할 때, 이는 여러 Bash의 동작을 변경합니다.

1. [Bash Startup Files](chapter_6_2.html)에서 설명한대로 기동 파일을 읽고 실행합니다.
2. 잡 컨트롤([Job Control](chapter_7.html)을 참조)은 기본으로 켜져 있습니다. 잡 컨트롤이 적용 중일 때, Bash는 키보드가 생성하는 잡 컨트롤 시그널인 `SIGTTIN`, `SIGTTOU`, `SIGTSTP`를 무시합니다.
3. Bash는 명령어의 첫 줄을 읽기 전에 `PS1`를 전개하고 출력하며, 여러 줄로 구성된 명령어의 두번째 줄부터를 읽기 전에 `PS2`를 전개하고 출력합니다. Bash는 명령어를 읽은 후, 실행하기 전에 `PS0`을 전개하고 출력합니다. 프롬프트 문자열 이스케이프 나열의 완전한 리스트는 [Controlling the Prompt](chapter_6_9.html)를 참조하세요.
4. Bash는 `PROMPT_COMMAND` 배열 변수의 요소에 들어있는 명령어를 주 프롬프트인 `$PS1`을 출력하기 전에 실행합니다([Bash Variables](chapter_5_2.html)를 참조).
5. 유저 터미널의 명령어를 읽기 위해 Readline([Command Line Editing](chapter_8.html)을 참조)을 사용합니다.
6. Bash는 명령어를 읽을 때 `EOF`를 받았을 때 즉시 종료하는 대신 `set -o`의 옵션의 `ignoreeof`를 검사합니다([The Set Builtin](chapter_4_3_1.html)을 참조).
7. 명령어 이력([Bash History Facilities](chapter_9_1.html)를 참조)와 이력 전개([History Interaction](chapter_9_3.html)을 참조)는 기본 설정으로 활성화되어 있습니다. Bash는 이력 기능이 활성화 되어 있는 상태에서 셸을 종료하면 명령어 이력을 `$HISTFILE`에 의해 지정된 파일에 저장합니다.
8. 별칭 전개([Aliases](chapter_6_6.html)를 참조)는 기본 설정으로 활성화되어 있습니다.
9. 트랩이 설정되어 있지 않다면 Bash는 `SIGTERM`을 무시합니다([Signals](chapter_3_7_6.html)를 참조).
10. 트랩이 설정되어 있지 않다면, `SIGINT`는 붙잡히고 처리됩니다([Signals](chapter_3_7_6.html)를 참조). `SIGINT`는 몇몇 셸 빌트인의 처리에 끼어듭니다.
11. 인터랙티브 로그인 셸은 `huponexit` 셸 옵션이 켜져 있다면([Signals](chapter_3_7_6.html)를 참조) 모든 잡에게 `SIGHUP`을 전송합니다.
12. `-n` 호출 옵션은 무시되며, '`set -n`'은 의미가 없습니다([The Set Builtin](chapter_4_3_1.html)을 참조)
13. Bash는 `MAIL`, `MAILPATH`와 `MAILCHECK` 셸 변수값에 의존하여 메일을 주기적으로 확인합니다([Bash Variables](chapter_5_2.html)를 참조).
14. '`set -u`'가 켜진 이후에 설정되지 않은 변수에 대한 참조로 인한 전개 에러는 셸을 종료시키지 않습니다([The Set Builtin](chapter_4_3_1.html)을 참조).
15. 제거되거나 `${var:?word}`로 널이 설정된 *var*로 인한 전개 에러는 셸을 종료시키지 않습니다([Shell Parameter Expansion](chapter_3_5_3.html)을 참조).
16. 셸 빌트인에서 발생한 리다이렉션 에러는 셸을 종료시키지 않습니다.
17. POSIX 모드에서 에러 스테이터스를 반환하는 특수 빌트인은 셸을 종료시키지 않습니다([Bash POSIX Mode](chapter_6_11.html)를 참조).
18. 실패한 `exec`는 셸을 종료시키지 않습니다([Bourne Shell Builtins](chapter_4_1.html)를 참조).
19. 문법 분석 에러는 셸을 종료시키지 않습니다.
20. `cd` 빌트인의 디렉터리 인수에 대한 간단한 철자 교정 기능은 기본 설정에서 켜져 있습니다([The Shopt Builtin](chapter_4_3_2.html)의 `shopt` 빌트인의 `cdspell` 옵션의 설명을 참조).
21. 셸은 `$PS1`을 출력한 뒤, 특정 시간(초) 동안 입력이 없을 때에 `TMOUT` 변수의 값을 검사하고 종료합니다([Bash Variables](chapter_5_2.html)를 참조).
