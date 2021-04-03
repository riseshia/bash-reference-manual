### 8.4.6 Commands For Completion
**complete (TAB)**

포인트 앞에 오는 텍스트에 대해 완성을 시도합니다. 실제 실행되는 완성은 애플리케이션마다 다릅니다. Bash는 텍스트를 변수('$'로 시작하는 경우), 유저명('~'로 시작하는 경우), 호스트명('@'로 시작하는 경우), 명령어(별칭과 함수 포함) 순서대로 완성을 시도합니다. 어느 것에도 일치하지 않는 경우 파일명 완성을 시도합니다.

**possible-completions (M-?)**

포인트 앞에 오는 텍스트에 사용 가능한 완성 목록을 출력합니다. 완성을 보여줄 때 Readline은 `completion-display-width`의 값 또는 `COLUMNS` 환경 변수의 값 또는 화면의 너비를 순서대로 확인해 출력할 너비(열 개수)를 설정합니다.

**insert-completions (M-*)**

포인트 앞 텍스트의 `possible-completions`로 생성된 모든 완성 후보를 삽입합니다.

**menu-complete ()**

`complete`와 유사하지만 완성 대상 단어를 완성 후보 리스트에 있는 단일 일치로 대체합니다. `menu-complete`를 반복해서 실행하면 완성 후보의 리스트를 하나씩 삽입합니다. 완성 리스트의 마지막에 도달하면 벨이 울리고(`bell-style`의 적용을 받습니다) 원래 텍스트가 복구됩니다. *n*의 인수는 리스트의 *n*번째 일치로 넘어갑니다. 음수 인수는 리스트의 반대 방향으로 이동합니다. 이 명령어는 `TAB`로 바인딩해서 사용하는 것을 의도하고 있습니다만, 기본 설정에서는 바인딩되어 있지 않습니다.

**menu-complete-backward ()**

`menu-complete`와 동일하지만 완성 후보 리스트를 탐색하는 방향이 반대이며, `menu-complete`에 음수 인수를 넘긴 것처럼 동작합니다.

**delete-char-or-list ()**

커서가 줄의 처음이나 마지막이 아니라면 (`delete-char`처럼) 커서에 위치한 문자를 지웁니다. 줄의 마지막이라면 `possible-completions`와 동일하게 동작합니다. 기본 설정에서 이 명령어에 바인딩된 키는 없습니다.

**complete-filename (M-/)**

포인트 앞의 텍스트에 대해 파일명 완성을 시도합니다.

**possible-filename-completions (C-x /)**

포인트 앞의 텍스트에 대해 파일명 완성의 완성 후보 리스트를 출력합니다.

**complete-username (M-~)**

포인트 앞의 텍스트에 대해 유저명 완성을 시도합니다.

**possible-username-completions (C-x ~)**

포인트 앞의 텍스트에 대해 유저명 완성의 완성 후보 리스트를 출력합니다.

**complete-variable (M-$)**

포인트 앞의 텍스트에 대해 셸 변수 완성을 시도합니다.

**possible-variable-completions (C-x $)**

포인트 앞의 텍스트에 대해 셸 변수 완성의 완성 후보 리스트를 출력합니다.

**complete-hostname (M-@)**

포인트 앞의 텍스트에 대해 호스트명 완성을 시도합니다.

**possible-hostname-completions (C-x @)**

포인트 앞의 텍스트에 대해 호스트명 완성의 완성 후보 리스트를 출력합니다.

**complete-command (M-!)**

포인트 앞의 텍스트에 대해 명령어 이름 완성을 시도합니다. 명령어 완성은 별칭, 예약어, 셸 함수, 셸 빌트인, 마지막으로 실행 가능한 파일명에 대해서 순서대로 일치를 시도합니다.

**possible-command-completions (C-x !)**

포인트 앞의 텍스트에 대해 명령어 이름 완성의 완성 후보 리스트를 출력합니다.

**dynamic-complete-history (M-TAB)**

포인트 앞의 텍스트에 대해 완성을 시도하고, 텍스트와 이력 리스트의 줄을 비교하여 일치하는 완성 후보를 찾습니다.

**dabbrev-expand ()**

포인트 앞의 텍스트에 대해 메뉴 완성을 시도하고, 텍스트와 이력 리스트의 줄을 비교하여 일치하는 완성 후보를 찾습니다.

**complete-into-braces (M-{)**

파일명 완성을 실행하고 셸에서 사용할 수 있도록 중괄호로 감싼 완성 후보의 리스트를 삽입합니다.
