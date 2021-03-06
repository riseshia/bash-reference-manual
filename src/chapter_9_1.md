## 9.1 Bash History Facilities
`set` 빌트인에 `-o history` 옵션을 켜짐으로 설정했을 때([The Set Builtin](chapter_4_3_1.html)을 참조), 셸은 이전에 입력한 명령어 리스트인 *명령어 이력*에 접근할 수 있도록 합니다. `HISTSIZE` 셸 변수의 값은 이력 리스트에 저장할 명령어의 개수를 지정합니다. 마지막 `$HISTSIZE` 명령어의 텍스트(기본값은 500)가 저장됩니다. 셸은 매개변수나 변수를 전개하기 전에 각 명령어를 이력 리스트에 저장합니다만, 이력 전개가 실행되면 셸 변수 `HISTIGNORE`와 `HISTCONTROL`의 값이 적용됩니다.

셸이 시작할 때, `HISTFILE` 변수(기본값은 `~/.bash_history`)로 지정된 파일로 이력을 초기화합니다. `HISTFILE`의 값에 지정된 파일은 필요에 따라서 저장하고 있는 이력이 `HISTFILESIZE` 변수의 값에 지정된 줄 수 이하가 되도록 여분을 잘라냅니다. 이력 기능이 활성화된 상태에서 셸을 종료할 때, 마지막 `$HISTSIZE` 개의 줄이 이력 리스트로부터 `$HISTFILE`로 지정한 파일에 복사됩니다. `histappend` 셸 옵션이 켜져있다면(Bash Builtins를 참조), 이력 파일의 마지막에 추가되며, 옵션이 꺼져 있다면 이력 파일 전체를 덮어씁니다. `HISTFILE`이 설정되어 있지 않거나 이력 파일에 쓰기 권한이 없을 때, 이력은 저장되지 않습니다. 이력을 저장한 후, 이력 파일은 `$HISTFILESIZE` 개의 줄보다 많은 줄을 포함하지 않도록 여분을 잘라냅니다. `HISTFILESIZE`가 설정되어 있지 않거나 또는 널, 숫자가 아닌 값, 0보다 작은 값이 설정되어 있다면, 이력 파일을 잘라내는 동작은 실행되지 않습니다.

`HISTTIMEFORMAT`이 설정되어 있다면, 각 이력에 대한 타임스탬프 정보가 이력 코멘트 문자와 함께 이력 파일에 기록됩니다. 이력 파일을 읽을 때, 이력 코멘트 문자 바로 뒤에 오는 숫자는 그 다음에 오는 이력의 타임 스탬프로 인식됩니다.

빌트인 명령어 `fc`는 이력 리스트의 한 부분을 출력하거나 편집하고 재실행할 수 있습니다. `history` 빌트인은 이력 리스트를 보여주거나 편집할 수 있으며 이력 파일을 편집할 수 있습니다. 커맨드 라인 편집 기능을 사용할 때 각 편집 모드는 이력 리스트에 접근하는 기능을 제공하며, 이를 통해 명령어를 검색할 수 있습니다(Commands For History를 참조).

셸은 어떤 명령어를 이력 리스트에 저장할지 제어할 수 있습니다. `HISTCONTROL`과 `HISTIGNORE` 변수를 설정하면 셸은 입력된 명령어의 일부만 저장합니다. `cmdhist` 셸 옵션이 켜져있다면, 셸이 여러줄 명령어의 각 줄을 하나의 이력으로 저장하도록 하며, 필요에 따라 세미콜론을 추가해 입력 자체를 정확하게 유지합니다. `lithist` 셸 옵션을 켜면 세미콜론 대신에 개행을 사용해 명령어를 유지합니다. 이 옵션들을 설정하려면 `shopt` 빌트인을 사용합니다. `shopt`에 대한 설명은 [The Shopt Builtin](chapter_4_3_2.html)을 참조하세요. 
