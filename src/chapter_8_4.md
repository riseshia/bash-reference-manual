## 8.4 Bindable Readline Commands
- [Commands For Moving](chapter_8_4_1.html) : 줄에서 이동하기.
- [Commands For Manipulating The History](chapter_8_4_2.html) : 이전 줄을 얻기.
- [Commands For Changing Text](chapter_8_4_3.html) : 텍스트를 변경하는 명령어.
- [Killing And Yanking](chapter_8_4_4.html) : 텍스트를 잘라내거나 재삽입하는 명령어.
- [Specifying Numeric Arguments](chapter_8_4_5.html) : 숫자 인수를 지정해서 반복하기.
- [Commands For Completion](chapter_8_4_6.html) : Readline이 대신 입력하게 만들기.
- [Keyboard Macros](chapter_8_4_7.html) : 입력한 문자를 저장하고 재실행하기.
- [Miscellaneous Commands](chapter_8_4_8.html) : 그 이외의 명령어들.

이 섹션에서는 키 나열을 바인딩할 수 있는 Readline 명령어에 대해서 설명합니다. 키 바인딩 리스트를 보려면 `bind -P`를 실행하거나 *inputrc* 파일에서 사용할 수 있는 간결한 형식으로 출력하는 `bind -p`를 실행하세요(Bash Builtins를 참조).

다음 설명에서 *포인트*는 현재 커서 위치를 가리키며 *마크*는 `set-mark` 명령어로 저장한 커서의 위치입니다. 포인트와 마크 사이의 텍스트는 선택 영역(*region*)이라고 부릅니다.
