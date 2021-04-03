# 8. Command Line Editing
이 장에서는 GNU 커맨드 라인 편집 인터페이스의 기본적인 기능에 대해서 설명합니다. 커맨드 라인 편집은 Readline 라이브러리가 제공하며, 이는 Bash를 포함해 다른 여러 프로그램에서도 사용됩니다. 커맨드 라인 편집 기능은 인터랙티브 셸이라면 기본 설정으로 켜져있습니다. 단, 셸 호출시에 `--noediting`  옵션을 넘긴 경우는 예외입니다. `read` 빌트인 명령어(Bash Builtins를 참조)에 `-e` 옵션을 넘겼을 때에도 줄 편집이 사용됩니다. 기본 설정으로, 줄 편집 명령어는 Emacs의 그것과 유사합니다. vi 스타일의 줄 편집 인터페이스도 사용 가능합니다. 줄 편집 기능은 `set` 빌트인 명령어 `-o emacs`나 `-o vi` 옵션을 넘기면([The Set Builtin](chapter_4_3_1.html)을 참조) 언제든지 켤 수 있습니다. 또는 끄기 위해서 `set`에 `+o emacs`나 `+o vi` 옵션을 넘길 수 있습니다.

- [Introduction and Notation](chapter_8_1.html) : 이 텍스트에서 사용되는 표기법.
- [Readline Interaction](chapter_8_2.html) : 줄 편집에서 사용되는 최소한의 명령어 집합.
- [Readline Init File](chapter_8_3.html) : 유저의 시점에서 Readline을 커스터마이즈하기.
- [Bindable Readline Commands](chapter_8_4.html) : Readline 명령어에서 바인딩에 사용가능한 거의 모든 설명.
- [Readline vi Mode](chapter_8_5.html) : Readline을 vi 에디터처럼 동작하게 만드는 방법에 대한 간략한 설명
- [Programmable Completion](chapter_8_6.html) : 특정 명령어를 위한 완성 후보를 식별하는 방법.
- [Programmable Completion Builtins](chapter_8_7.html) : 개별 명령어의 인수를 완성하는 방법을 식별하기 위한 빌트인 명령어.
- [A Programmable Completion Example](chapter_8_8.html) : 완성 후보를 생성하는 셸 함수 예제.
