### 8.3.3 Sample Init File
다음은 *inputrc* 파일 예제입니다. 이는 키 바인딩, 변수 대입, 조건부 문법의 사용법을 보여줍니다.

```sh
# 이 파일은 GNU Readline 라이브러리를 사용하는 프로그램의 줄 입력 편집의 동작을
# 제어합니다. 프로그램은 FTP, Bash, GDB를 포함합니다.
#
# C-x C-r로 inputrc 파일을 다시 읽을 수 있습니다.
# '#'로 시작하는 줄은 코멘트입니다.
#
# 첫번째로 /etc/inputrc로부터 시스템 전체에 영향을 미치는 바인딩과
# 변수 대입을 가져옵니다.
$include /etc/inputrc

#
# emacs 모드 바인딩을 설정합니다.

set editing-mode emacs 

$if mode=emacs

Meta-Control-h:	backward-kill-word 함수명 뒤에 오는 텍스트는 무시됩니다

#
# 키패드 모드의 방향키
#
#"\M-OD":        backward-char
#"\M-OC":        forward-char
#"\M-OA":        previous-history
#"\M-OB":        next-history
#
# ANSI 모드의 방향키
#
"\M-[D":        backward-char
"\M-[C":        forward-char
"\M-[A":        previous-history
"\M-[B":        next-history
#
# 8비트 키패드 모드의 방향키
#
#"\M-\C-OD":       backward-char
#"\M-\C-OC":       forward-char
#"\M-\C-OA":       previous-history
#"\M-\C-OB":       next-history
#
# 8비트 ANSI 모드의 방향키
#
#"\M-\C-[D":       backward-char
#"\M-\C-[C":       forward-char
#"\M-\C-[A":       previous-history
#"\M-\C-[B":       next-history

C-q: quoted-insert

$endif

# 구식 바인딩. 이는 우연한 기본 설정입니다.
TAB: complete

# 셸 상호작용에 편리한 매크로들
$if Bash
# 경로 수정하기
"\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
# 따옴표로 감싼 단어를 입력 준비하기 --
# 여는 큰따옴표와 닫는 큰따옴표를 삽입하고
# 여는 따옴표 뒤로 이동시킵니다
"\C-x\"": "\"\"\C-b"
# 백슬래시를 삽입합니다(키 나열과 매크로의 백슬래시 이스케이프를 테스트합니다)
"\C-x\\": "\\"
# 현재 또는 직전 단어를 큰따옴표로 감쌉니다
"\C-xq": "\eb\"\ef\""
# 확정되지 않은 줄을 새로고침하는 바인딩을 추가합니다
"\C-xr": redraw-current-line
# 현재 줄의 변수를 편집합니다
"\M-\C-v": "\C-a\C-k$\C-y\M-\C-e\C-a\C-y="
$endif

# 사용 가능하다면 보이는 벨을 사용합니다
set bell-style visible

# 읽을 때 문자에서 8비트째를 지우지 않습니다
set input-meta on

# iso-latin1 문자를 메타 키로 시작하는 나열로 변환하는 대신
# 그대로 삽입합니다
set convert-meta off

# 8번째 비트를 포함한 문자를 메타 키로 시작하는 나열로 변환해
# 출력하는 대신 그대로 출력합니다.
set output-meta on

# 단어에 150개 이상의 완성 후보가 있다면,
# 이를 전부 출력할지 묻습니다
set completion-query-items 150

# FTP 설정
$if Ftp
"\C-xg": "get \M-?"
"\C-xt": "put \M-?"
"\M-.": yank-last-arg
$endif
```
