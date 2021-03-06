## 4.2 Bash Builtin Commands
이 섹션에서는 Bash에서만 제공하거나 Bash에서 확장된 빌트인 명령어를 설명합니다. 몇몇 명령어는 POSIX 표준에서 규정되어 있습니다.

**alias**

```sh
alias [-p] [name[=value] …]
```
넘긴 인수가 없거나 `-p` 옵션을 넘겼다면 `alias`는 입력으로 재사용 가능한 형식의 별칭 리스트를 표준 출력으로 출력합니다. 만약 인수를 넘겼다면 각 *name*과 함께 주어진 *value*를 별칭으로 정의합니다. 만약 *value*가 없다면, 해당 이름의 별칭과 그 값을 출력합니다. 별칭은 Aliases에서 자세히 설명합니다.

**bind**

```sh
bind [-m keymap] [-lpsvPSVX]
bind [-m keymap] [-q function] [-u function] [-r keyseq]
bind [-m keymap] -f filename
bind [-m keymap] -x keyseq:shell-command
bind [-m keymap] keyseq:function-name
bind [-m keymap] keyseq:readline-command
```
현재 Readline([Command Line Editing](chapter_8.html)을 참조)의 키와 함수 바인딩을 출력하거나 Readline 함수나 매크로에 키 나열을 바인드하거나 Readline 변수를 설정합니다. 옵션이 아닌 각 인수는 Readline 초기화 파일([Readline Init File](chapter_8_3.html)을 참조)에 실려있는 명령어입니다. 다만 각 바인딩이나 명령어는 별도의 인수로 넘겨야 합니다. e.g., '"\C-x\C-r:re-read-init-file"'.

옵션을 사용했다면 다음과 같은 의미입니다.
- **-m *keymap***

  뒤에 따라오는 바인딩을 *keymap*의 키맵으로 사용합니다. 사용할 수 있는 *keymap* 이름은 `emacs`, `emacs-standard`, `emacs-meta`, `emacs-ctlx`, `vi`, `vi-move`, `vi-command`, `vi-insert`입니다. `vi`는 `vi-command`와 같습니다(`vi-move` 역시 동의어입니다). `emacs`는 `emacs-standard`와 같습니다.
- **-l**

  모든 Readline 함수의 이름을 출력합니다.
- **-p**

  Readline 함수 이름과 그 바인딩을 입력이나 Readline 초기화 파일에서 사용할 수 있는 형식으로 출력합니다.
- **-P**

  현재 Readline 함수 이름과 그 바인딩을 출력합니다.
- **-v**

  Readline 변수 이름과 그 값을 입력이나 Readline 초기화 파일에서 사용할 수 있는 형식으로 출력합니다.
- **-V**

  현재 Readline 변수 이름과 그 값을 출력합니다.
- **-s**

  Readline의 매크로와 문자열에 바인드된 키 나열을 입력이나 Readline 초기화 파일에서 사용할 수 있는 형식으로 출력합니다.
- **-S**

  Readline의 매크로와 문자열에 바인드된 키 나열을 출력합니다.
- **-f *filename***

  *filename*으로부터 키 바인딩을 읽습니다.
- **-q *function***

  *function*이라는 이름을 호출하는 키가 무엇인지 질의합니다.
- **-u *function***

  *function*이라는 이름에 바인드된 모든 키를 언바인드합니다.
- **-r *keyseq***

  *keyseq*의 바인딩을 모두 제거합니다.
- **-x *keyseq*:*shell-command***

  *keyseq*가 입력될 때 *shell-command*를 실행하도록 합니다. *shell-command*가 실행되면 셸은 `READLINE_LINE` 변수에 Readline의 줄 버퍼의 내용을 저장하고, `READLINE_POINT`와 `READLINE_MARK` 변수에 각각 삽입 지점의 현재 위치와 저장된 삽입 위치(*mark*)를 저장합니다. 만약 실행된 명령어가 `READLINE_LINE`, `READLINE_POINT`, `READLINE_MARK`의 값을 변경한다면, 새 값이 편집 상태에 반영됩니다.
- **-X**

  셸 명령어에 바인드된 모든 키 나열과 연관된 명령어를 입력으로 재활용 가능한 형식으로 출력합니다.

잘못된 옵션을 넘기거나, 에러가 발생하는 경우를 제외하면 종료 스테이터스는 0입니다.

**builtin**

```sh
builtin [shell-builtin [args]]
```
*args*를 넘기고 셸 빌트인을 실행한 뒤 종료 스테이터스를 반환합니다. 이는 셸 빌트인과 동일한 이름의 셸 함수를 정의하고 함수 안에서 빌트인의 기능을 유지하고 싶을 때 유용합니다. *shell-builtin*이 셸 빌트인 명령어가 아니라면 종료 스테이터스는 0이 아닌 값입니다.

**caller**

```sh
caller [expr]
```
어떤 액티브 서브루틴 호출(셸 함수나 `.`이나 `source` 빌트인으로 실행된 스크립트)의 컨텍스트를 반환합니다.

*expr*를 넘기지 않았다면 `caller`는 줄 번호와 현재 서브루틴을 호출한 소스 파일의 이름을 출력합니다. *expr*에 음수가 아닌 정수를 넘긴다면 `caller`는 현재 실행 호출 스택의 해당 위치에 대응하는 줄 번호, 서브루틴의 이름, 소스파일 이름을 출력합니다. 이 추가 정보는 예를 들어 스택 트레이스를 출력할 때에 사용될 수 있습니다. 현재 프레임은 프레임 0입니다.

셸이 서브루틴 호출을 실행 중이 아니거나 *expr*이 호출 스택에서 유효한 위치를 참조하고 있지 않은 경우가 아니라면 반환 값은 0입니다.

**command**

```sh
command [-pVv] command [arguments …]
```
*command*라는 이름의 셸 함수가 존재한다면 이를 무시하고 *command*를 *arguments*와 함께 실행합니다. 셸 빌트인 명령어와 `PATH`에서 발견된 명령어만이 실행됩니다. 만약 `ls`라는 이름의 셸 함수가 있고 함수 내부에서 'command ls'를 실행한다면 이는 함수 자신을 재귀적으로 호출하는 대신 외부 명령어 `ls`를 실행합니다. `-p` 옵션은 `PATH`의 기본값을 사용해서 모든 표준 유틸리티를 검색할 것을 보장합니다. *command*를 찾을 수 없거나 에러가 발생했다면 반환 스테이터스는 127이 되며, 그렇지 않은 경우 *command*의 종료 스테이터스를 사용합니다.

만약 `-V`나 `-v` 옵션을 넘겼다면, *command*의 설명이 출력됩니다. `-v` 옵션은 명령어를 가리키는 한 단어나 *command*를 호출할때 사용되는 파일 이름을 출력합니다. `-V` 옵션은 좀 더 상세한 설명을 생성합니다. *command*를 발견했다면 종료 스테이터스는 0이며, 그렇지 못한 경우에는 0이 아닌 값이 됩니다.

**declare**

```sh
declare [-aAfFgiIlnrtux] [-p] [name[=value] …]
```
변수를 선언하고 속성을 부여합니다. *name*을 넘기지 않았다면, 변수의 값들을 출력합니다.

`-p` 옵션은 각 *name*의 속성과 값을 출력합니다. `-p`가 *name* 인수와 함께 사용되었다면 `-f`와 `-F`와 같은 추가 옵션을 무시합니다.

`-p` 옵션을 *name* 인수 없이 사용했다면 `declare`는 추가 옵션으로 지정된 속성을 가지는 모든 변수의 속성과 값을 출력합니다. 만약 `-p`와 함께 사용한 추가 옵션이 없다면 `declare`는 모든 셸 변수의 속성과 값을 출력합니다. `-f` 옵션은 셸 함수만 출력하도록 합니다.

`-F` 옵션은 함수의 정의를 출력하지 않도록 합니다. 함수의 이름과 속성만을 출력합니다. `shopt`([The Shopt Builtin](chapter_4_3_2.html)을 참조)를 통해 `extdebug` 셸 옵션이 켜져있다면 각 *name*이 정의되어 있는 소스 파일 이름과 줄 번호도 같이 출력됩니다. `-F`는 `-f`의 동작을 포함합니다.

`-g` 옵션은 `declare`가 셸 함수에서 실행된다 하더라도 전역 스코프에서 변수를 생성하거나 전역 스코프의 값을 수정하도록 강제합니다. 그 이외의 모든 경우에는 무시됩니다.

`-I` 옵션은 지역 변수가 감싸고 있는 스코프에 같은 *name*을 가지는 변수가 있다면 속성(*nameref* 속성을 제외)과 값을 상속하도록 만듭니다. 만약 해당하는 변수가 없다면 지역 변수는 존재하지 않는 상태로 시작합니다.

다음 옵션으로 특정 속성을 가지는 변수만 출력하도록 제한하거나, 변수에 속성을 지정할 수 있습니다.

- **-a**

  각 *name*은 순차 배열 변수([Arrays](chapter_6_7.html)를 참조)입니다.
- **-A**

  각 *name*은 연상 배열 변수([Arrays](chapter_6_7.html)를 참조)입니다.
- **-f**

  함수명만을 사용합니다.
- **-i**

  값이 정수로 다루어져야하는 변수입니다. 변수에 값이 대입될 때 산술 평가([Shell Arithmetic](chapter_6_5.html)을 참조)가 실행됩니다.
- **-l**

  변수에 값을 대입할 때 모든 대문자는 소문자로 변환됩니다. 대문자 속성이 무효화됩니다.
- **-n**

  각 *name*에 nameref 속성을 부여하여 다른 변수에 대한 이름 참조로 만듭니다. 참조할 변수는 *name*의 값으로 정의됩니다. *name*에 대한 모든 참조, 대입, 속성 변경은 `-n` 속성 자신을 변경하거나 사용하는 경우를 제외하면 *name*의 값이 참조하고 있는 변수에 대해서 실행됩니다. nameref 속성은 배열 변수에 적용할 수 없습니다.
- **-r**

  *name*을 읽기 전용으로 만듭니다. 이 이름은 이후의 대입문으로 값을 변경하거나 제거할 수 없습니다.
- **-t**

  각 *name*에 `trace` 속성을 부여합니다. 추적되는 함수는 호출한 셸로부터 `DEBUG`와 `RETURN` 트랩을 상속합니다. 변수의 추적 속성은 아무런 의미가 없습니다.
- **-u**

  변수에 값을 대입할 때, 모든 소문자를 대문자로 변경합니다. 소문자 속성이 무효화됩니다.
- **-x**

  각 *name*을 환경을 통해 이후의 명령어 실행시에 익스포트하도록 설정합니다.
속성을 제거하고 싶다면 '-' 대신 '+'를 사용하세요. 단 '+a'와 '+A'는 배열 변수를 삭제할 수 없으며 '+r'은 읽기 전용 속성을 제거하지 않습니다. 함수에서 사용되면 `declare`는 `-g` 옵션을 사용하지 않았다면 각 `name`을 `local` 명령어를 사용한 것처럼 해당 지역에 선언합니다. 만약 변수 이름 뒤에 =*value*가 따라온다면, 변수의 값으로 *value*가 설정됩니다.

`-a`나 `-A`를 사용하고 복합 대입 문법을 사용하여 배열 변수를 생성할 때, 추가 속성은 이후의 대입까지 적용되지 않습니다.

잘못된 옵션을 사용하거나, '-f foo=bar'를 이용해서 함수를 선언하거나, 읽기 전용 변수에 값을 할당하거나, 복합 대입 문법([Arrays](chapter_6_7.html)를 참조)을 사용하지 않고 배열 변수에 값을 할당하거나, *name* 중 하나라도 올바르지 많은 셸 변수 이름을 사용하거나, 읽기 전용 변수의 읽기 전용 속성의 무효화를 시도하거나, 배열 변수의 배열 상태의 무효화를 시도하거나, 존재하지 않는 함수를 `-f`로 출력하려고 시도하는 경우가 아니라면 종료 스테이터스는 0입니다.

**echo**

```sh
echo [-neE] [arg …]
```
*args*를 스페이스로 구분해 출력하고 개행으로 종료합니다. 쓰기 중에 에러가 발생하지 않았다면 종료 스테이터스는 0입니다. `-n`을 넘겼다면 마지막의 개행을 출력하지 않습니다. `-e`를 넘겼다면 백슬래시로 이스케이프된 문자 처리가 유효화됩니다. `-E` 옵션은 시스템이 기본으로 처리하도록 설정되어 있다고 하더라도 이스케이프 문자 처리를 무효화합니다. `xpg_echo` 셸 옵션으로 `echo`가 이스케이프 문자를 기본으로 전개 할지 말지 지정할 수 있습니다. `echo`는 `--`를 옵션의 끝으로 인식하지 않습니다.

`echo`는 다음 이스케이프 나열을 처리할 수 있습니다.

- **\a**

  경고 (벨소리)
- **\b**

  백스페이스
- **\c**

  이후의 출력을 무시
- **\e**

- **\E**

  이스케이프
- **\f**

  폼 피드
- **\n**

  개행
- **\r**

  캐리지 리턴
- **\t**

  탭
- **\v**

  수직탭
- **\\**

  백슬래시
- **\0*nnn***

  8진수 *nnn* 으로 표현된 8비트 문자(3글자까지 허용)
- **\x*HH***

  16진수 *HH* 으로 표현된 8비트 문자(2글자까지 허용)
- **\u*HHHH***

  16진수 *HHHH* 로 표현된 유니코드(ISO/IEC 10646) 문자(16진수 4글자까지 허용)
- **\U*HHHHHHHH***

  16진수 *HHHHHHHH* 로 표현된 유니코드(ISO/IEC 10646) 문자(8진수 8글자까지 허용)

**enable**

```sh
enable [-a] [-dnps] [-f filename] [name …]
```
빌트인 셸 명령어를 유효화하거나 무효화합니다. 빌트인을 무효화하면 셸이 일반적으로 디스크 상의 명령어보다 빌트인을 우선해서 찾도록 되어있음에도 불구하고, 전체 경로를 지정하지 않더라도 셸 빌트인과 같은 이름을 가지고 있는 디스크 상의 명령어를 실행하도록 합니다. 만약 `-n`을 넘겼다면 *name*이 무효화됩니다.

이외의 경우에는 *name*을 유효화합니다. 셸 빌트인 버전 대신에 `$PATH` 상에서 찾을 수 있는 `test` 바이너리를 사용하도록 하고 싶다면 'enable -n test'라고 입력하세요.

`-p` 옵션을 넘기거나 *name* 인수를 넘기지 않았다면 셸 빌트인 명령어의 리스트가 출력됩니다. 만약 다른 인수가 없다면 리스트는 유효화되어 있는 모든 셸 빌트인입니다. `-a` 옵션은 각 빌트인을 자신이 유효한지 아닌지에 대한 정보와 함께 출력하도록 합니다.

`-f` 옵션은 다이나믹 로딩을 지원하는 시스템에서 공유 오브젝트 *filename*으로부터 새 빌트인 명령어 *name*을 로드합니다. `-f`와 함께 사용한 `-d` 옵션은 로드된 빌트인을 삭제합니다.

만약 옵션을 넘기지 않았다면 셸 빌트인의 리스트가 출력됩니다. `-s` 옵션은 `enable`이 POSIX의 특수 빌트인만을 출력하도록 제한합니다. `-f`와 함께 사용한 `-s`는 새 빌트인을 특수 빌트인으로 만듭니다(Special Builtin을 참조).

*name*이 셸 빌트인이 아니거나 공유 오브젝트로부터 새 빌트인을 로딩할 때 에러가 발생한 경우를 제외하면 종료 스테이터스는 0입니다.

**help**

```sh
help [-dms] [pattern]
```
빌트인 명령어에 대한 유용한 정보를 출력합니다. *pattern*을 지정했다면 `help`는 *pattern*에 일치하는 모든 명령어에 대한 상세한 도움말을 제공합니다. 지정이 없다면 모든 빌트인의 리스트가 출력됩니다.

옵션은 다음의 의미를 가집니다.

- **-d**

  각 *pattern*의 짧은 설명을 출력합니다.
- **-m**

  각 *pattern*의 설명을 manpage 형식으로 출력합니다.
- **-s**

  각 *pattern*의 짧은 요약을 출력합니다.

*pattern*과 일치하는 명령어가 없는 경우가 아니라면 종료 스테이터스는 0입니다.

**let**

```sh
let expression [expression …]
```
`let` 빌트인은 셸 변수에서 산술 연산을 할 수 있도록 합니다. 각 *expression*은 Shell Arithmetic의 규칙에 따라 평가됩니다. 만약 마지막 *expression*이 0으로 평가된다면 `let`은 1을 반환합니다. 그 이외의 경우 0을 반환합니다.

**local**

```sh
local [option] name[=value] …
```
각 인수에 대해서 *name*이라고 명명된 지역 변수를 생성하며, *value*를 대입합니다. *option*은 `declare`에서 사용 가능한 옵션이라면 어떤 옵션이든 사용할 수 있습니다. `local`은 함수 내부에서만 사용할 수 있습니다. `local`은 *name*이라는 변수를 해당 함수와 그 자식들에게만 보이는 스코프로 제한합니다. 만약 *name*이 '-'라면 셸 옵션의 집합을 `local`이 호출된 함수의 지역에 생성합니다. 함수 내부에서 `set` 빌트인을 사용하여 변경한 셸 옵션들은 함수가 반환될 때 원래 값으로 복원됩니다. 이 복원은 마치 함수 실행 전에 가지고 있던 값으로 복원하는 일련의 `set` 명령어가 실행되는 것처럼 동작합니다. `local`을 함수 밖에서 사용하거나, 유효하지 않은 *name*을 사용하거나 *name*이 읽기 전용인 경우가 아니라면 종료 스테이터스는 0입니다.

**logout**

```sh
logout [n]
```
로그인 셸을 종료하고 셸의 부모에게 스테이터스 *n*을 반환합니다.

**mapfile**

```sh
mapfile [-d delim] [-n count] [-O origin] [-s count]
    [-t] [-u fd] [-C callback] [-c quantum] [array]
```
표준 입력으로부터 복수의 줄을 순차 배열 변수 *array*로 읽어들입니다. `-u` 옵션을 사용하면 파일 디스크립터 *fd*로부터 읽어들입니다. 변수 `MAPFILE`이 *array*의 기본값입니다. 옵션을 넘길 수 있으며 각 옵션은 다음과 같은 의미입니다.

- **-d**

  각 입력 라인의 끝으로 개행 대신 *delim*의 첫번째 글자를 사용합니다. 만약 *delim*이 빈 문자열이라면, `mapfile`은 널 문자를 읽었을 때 한 줄을 끝낼 것입니다.
- **-n**

  최대 *count*줄을 복사합니다. *count*가 0이면 모든 줄을 복사합니다.
- **-O**

  *array*에 값을 대입할 때 *origin*번째 인덱스부터 시작하도록 합니다. 기본값은 0입니다.
- **-s**

  처음 읽어들인 *count*개의 줄을 버립니다.
- **-t**

  각 줄을 입력받을 때 마지막의 *delim*(기본값은 개행)을 제거합니다.
- **-u**

  표준 입력 대신 파일 디스크립터 *fd*로부터 줄을 읽습니다.
- **-C**

  매 *quantum* 줄을 읽을 때 마다 *callback*을 평가합니다. `-c` 옵션에 *quantum*을 지정합니다.
- **-c**

  *callback*을 호출과 다음 호출 사이에 읽을 줄 수를 지정합니다.

`-c` 없이 `-C`를 지정하는 경우, 기본 간격은 5000입니다. `callback`이 평가될 때, 다음에 대입될 배열 요소의 인덱스와 그 요소에 대입할 줄을 추가 인수로 넘겨받습니다. *callback*은 줄을 읽은 다음, 배열 요소에 대입되기 전에 평가됩니다.

명시적으로 배열 변수가 지정되지 않을 경우, `mapfile`은 대입을 시작하기 전에 `array`를 초기화합니다.

`mapfile`은 유효하지 않은 옵션 또는 옵션의 인수를 넘기거나, *array*가 유효하지 않거나 대입이 불가능하거나, 순차 배열이 아닌 경우를 제외하면 성공적으로 종료됩니다.

**printf**

```sh
printf [-v var] format [arguments]
```
*format* 서식이 적용된 *arguments*를 표준 출력에 넘깁니다. `-v` 옵션은 표준 출력에 값을 넘기는 대신 변수 *var*에 대입합니다.

*format*은 3가지의 오브젝트 타입을 포함하는 문자열입니다. 일반 문자는 표준 출력에 그대로 복사됩니다. 이스케이프 문자 나열은 적절한 변환이 이루어진 뒤에 표준 출력으로 복사됩니다. 포맷 명세는 각각 뒤따라오는 *argument*를 출력합니다. 표준 `printf(1)` 포맷에 더해, `printf`는 다음의 확장을 처리할 수 있습니다.

- **%b**

  `printf`가 각각의 대응하는 *argument*의 백슬래시 이스케이프 문자 나열을 `echo -e`(Bash Builtins를 참조)와 같은 방식으로 전개합니다.
- **%q**

  `printf`가 셸 입력으로 재활용 가능한 형식으로 각각의 대응하는 *argument*를 출력합니다.
- **%(*datefmt*)T**

  `printf`가 `strftime(3)`의 포맷 문자열 `datefmt`를 사용하여 생성된 날짜-시각 문자열을 출력합니다. 대응하는 *argument*는 유닉스 시각을 초로 나타낸 정수입니다. 2개의 특수한 인수 값을 사용할 수 있습니다. -1은 현재 시각을 나타내며, -2는 셸이 실행된 시각을 나타냅니다. 만약 인수를 넘기지 않았다면 -1을 넘긴 것처럼 변환합니다. 이는 `printf` 동작 방식의 예외입니다.

`%b`, `%q`, `%T` 디렉티브는 모두 포맷 명세의 필드 너비와 정확도 인수를 사용할 수 있으며, 전개된 인수만큼의 바이트를 출력하며(또는 그만큼의 필드 너비를 사용합니다) 이는 원래의 문자열보다 더 많은 문자를 포함할 수 있습니다.

문자열용이 아닌 포맷 식별자의 인수는 C 언어 상수인 것처럼 다루어집니다. 플러스나 마이너스 기호로 시작하는 것은 예외입니다. 첫 문자가 큰따옴표나 작은따옴표라면 뒤따라오는 값은 ASCII 값입니다.

*format*은 모든 *argument*를 소비할 때까지 재활용됩니다. *format*이 넘겨진 것보다 많은 *argument*를 필요로 하는 경우, 여분의 포맷 명세는 0이나 널 문자를 넘긴 것처럼 처리됩니다. 성공했을 때의 종료값은 0이며, 실패했을 때에는 0이 아닌 값입니다.

**read**

```sh
read [-ers] [-a aname] [-d delim] [-i text] [-n nchars]
    [-N nchars] [-p prompt] [-t timeout] [-u fd] [name …]
```
표준 입력 또는 파일 디스크립터 `-u` 옵션을 넘겼을 경우 *fd*으로부터 한 줄을 읽고 [Word Splitting](chapter_3_5_7.html)에서 설명한 것처럼 단어를 분리하고 첫번째 단어를 첫번째 *name*에 대입하고 두번째 단어를 두번째 *name*에 대입을 반복합니다. 넘긴 이름의 개수보다 단어의 숫자가 많다면 나머지 단어들은 구분자를 사용하여 마지막 *name*에 대입됩니다. 넘긴 이름 개수보다 입력 스트림으로부터 읽어들인 단어 수가 적을 경우, 남는 이름에는 빈 값을 대입합니다. `IFS` 변수값의 문자를 단어를 분리하기 위해서 사용합니다. 단어 분리는 셸이 전개시에 사용하는 것과 동일한 규칙으로 이루어집니다([Word Splitting](chapter_3_5_7.html)을 참조). 백슬래시 문자 '\'는 다음에 오는 문자의 특수한 의미를 제거하거나 줄을 계속하기 위해서 사용할 수 있습니다.

다음의 옵션을 사용할 수 있습니다.

- **-a *aname***

  배열 변수 *aname*에 0번째 인덱스로부터 순서대로 단어를 대입합니다. *aname*의 모든 요소는 대입이 시작되기 전에 제거됩니다. *name* 인수는 무시됩니다.
- **-d *delim***

  개행 대신 *delim*의 첫번째 문자를 입력 줄의 종료로 인식합니다. *delim*이 빈 문자열이라면 `read`는 NUL 문자를 읽을 때 줄을 종료합니다.
- **-e**

  Readline([Command Line Editing](chapter_8.html)을 참조)으로 줄을 읽습니다. Readline은 현재 편집 설정(또는 줄 편집을 이전에 유효화하지 않았다면 기본값)을 사용합니다만, Readline의 기본 파일 이름 완성을 사용합니다.
- **-i *text***

  줄을 읽기 위해서 Readline을 사용하는 경우, 편집이 시작되기전에 *text*를 편집 버퍼에 넣습니다.
- **-n *nchars***

  `read`가 입력의 줄을 완전히 읽는 것을 기다리지 않고 *nchars* 개의 문자만 읽고 종료합니다. 단, 구분자를 만나기 전에 *nchars*개의 문자가 이미 출현했을 경우, 구분자까지 읽습니다.
- **-N *nchars***

  `read`는 입력의 줄을 완전히 읽는 것을 기다리지 않고 정확히 *nchars*개의 문자를 읽고 종료합니다. 단, EOF를 만나거나 `read`가 타임아웃하는 경우는 예외입니다. 입력에서 구분자를 만나더라도 일반 문자인 것처럼 취급하며, *nchars*를 읽기 전까지는 `read`가 종료되지 않습니다. 읽은 결과는 `IFS`의 문자로 분리되지 않습니다. 이는 읽어들인 문자를 그대로 변수에 대입하기 위함입니다. (단 백슬래시는 예외입니다. 아래의 `-r` 옵션을 참조하세요)
- **-p *prompt***

  입력을 읽기 전에 마지막의 개행을 제거한 *prompt*를 출력합니다. 프롬프트는 입력을 터미널로부터 받을 때에만 출력됩니다.
- **-r**

  이 옵션을 사용하면 백슬래시는 이스케이프 문자인 것처럼 행동하지 않습니다. 백슬래시는 줄의 일부인 것처럼 다루어집니다. 백슬래시와 개행의 묶음은 줄을 계속한다는 의미로 사용할 수 없다는 점에 주의하세요.
- **-s**

  사일런트 모드. 입력이 터미널로부터 들어온다면 문자를 재출력하지 않습니다.
- **-t *timeout***

  `read`가 *timeout*초 이내에 입력 줄을 완전히 읽지 못한 경우(또는 특정 개수의 문자를 읽지 못한 경우) 타임아웃으로 실패하도록 합니다. *timeout*는 소숫점 이하를 포함할 수 있는 10진수입니다. 이 옵션은 `read`가 입력을 터미널, 파이프, 또는 다른 특수 파일로부터 읽을 때만 유효합니다. 일반 파일을 읽을 때에는 유효하지 않습니다. `read`가 타임아웃했다면 `read`는 읽은 입력의 일부를 *name*에 기록합니다. *timeout*이 0이라면 `read`는 데이터를 읽으려고 시도하지 않고 즉시 종료합니다. 입력이 지정된 파일 디스크립터로부터 입력을 읽을 수 있다면 종료 스테이터스는 0이며, 그렇지 않다면 0이 아닌 값입니다. 타임아웃으로 종료하는 경우, 종료 스테이터스는 128보다 큽니다.
- **-u *fd***

  입력을 파일 디스크립터 *fd*로부터 읽습니다.

*name*을 넘기지 않았다면, 줄의 끝을 표시하는 구분자를 제외한 입력 줄이 변수 `REPLY`에 대입됩니다. 파일의 종료(EOF)를 만나거나, `read`가 타임아웃으로 종료(이 경우의 스테이터스는 128보다 큽니다)하거나 변수 대입 에러(읽기 전용 변수에 대입을 시도했다든가)가 발생하거나 `-u` 옵션의 인수로 받은 파일 디스크립터가 잘못되어 있는 경우가 아니라면 종료 스테이터스는 0입니다.

**readarray**

```sh
readarray [-d delim] [-n count] [-O origin] [-s count]
    [-t] [-u fd] [-C callback] [-c quantum] [array]
```

표준 입력으로부터 복수의 줄을 순차 배열 변수 *array*로 읽어들입니다. `-u` 옵션을 사용하면 파일 디스크립터 *fd*로부터 읽어들입니다.

`mapfile`의 동의어입니다.

**source**

```sh
source filename
```
`.`의 동의어([Bourne Shell Builtins](chapter_4_1.html)을 참조).

**type**

```sh
type [-afptP] [name …]
```
각 *name*이 명령어 이름으로 사용될 때 어떻게 처리되는지 알려줍니다.

`-t` 옵션을 사용하면 `type`는 'alias', 'function', 'builtin', 'file', 'keyword' 중 한 단어를 출력합니다. *name*은 별칭, 셸 함수, 셸 빌트인, 디스크 파일, 셸 예약어가 될 수 있습니다. *name*을 찾을 수 없다면 아무것도 출력되지 않으며, `type`은 실패 상태를 반환합니다.

`-p` 옵션을 사용하면 `type`은 실행될 디스크 파일의 이름을 반환하거나 `-t`가 'file'을 반환하지 않는 값에 대해서는 아무것도 반환하지 않습니다.

`-P` 옵션은 각 *name*의 `-t` 옵션일 때 'file'을 반환하지 않는다고 하더라도 디스크에서 찾도록 합니다.

명령어가 해싱되었다면 `-p`와 `-P`는 해싱된 값을 출력하며, 이는 `$PATH`에서 첫번째로 발견한 파일이 아닐 수 있습니다.

`-a`를 사용하면 `type`는 `file`이라는 이름을 가지는 실행 가능한 파일을 포함하는 모든 위치를 반환합니다. 이는 별칭과 함수를 포함합니다만, 단 `-p` 옵션을 사용한 경우에는 예외입니다.

`-f` 옵션을 사용하면 `type`는 `command` 빌트인처럼 셸 함수를 찾지 않습니다.

종료 스테이터스는 모든 *name*을 발견했다면 0이며, 하나라도 발견하지 못했다면 0이 아닌 값입니다.

**typeset**

```sh
typeset [-afFgrxilnrtux] [-p] [name[=value] …]
```
`typeset` 명령어는 ksh과의 호환성을 위해서 제공됩니다. 이는 `declare` 빌트인 명령어와 같습니다.

**ulimit**

```sh
ulimit [-HS] -a
ulimit [-HS] [-bcdefiklmnpqrstuvxPRT] [limit]
```
`ulimit`은 셸에서 실행되는 프로세스가 사용 가능한 리소스를 시스템 상에서 제어할 수 있게 해줍니다. 옵션은 다음과 같이 처리됩니다.

**-S**

  연관된 리소스의 소프트 리밋을 변경하고 보고합니다.
**-H**

  연관된 리소스의 하드 리밋을 변경하고 보고합니다.
**-a**

  현재의 모든 리밋을 보고합니다. 새 리밋을 설정하지 않습니다.
**-b**

  최대 소켓 버퍼 크기.
**-c**

  생성하는 코어 파일의 최대 크기.
**-d**

  프로세스의 데이터 세그먼트의 최대 크기.
**-e**

  스케줄링 우선순위의 최대값("nice" 명령어의 우선순위).
**-f**

  셸과 그 자식이 쓸 수 있는 파일의 최대 크기.
**-i**

  대기 시그널의 최대 개수.
**-k**

  할당 가능한 kqueue의 최대 개수.
**-l**

  고정 할당하는 메모리의 최대 크기.
**-m**

  레지던트 셋의 최대 크기(많은 시스템은 이 값을 참조하지 않습니다).
**-n**

  열 수 있는 파일 디스크립터의 최대 개수(많은 시스템에서는 이 값을 변경할 수 없습니다).
**-p**

  파이프 버퍼 크기.
**-q**

  POSIX 메시지 큐의 최대 바이트.
**-r**

  실시간 스케줄링 우선순위의 최대값.
**-s**

  최대 스택 크기.
**-t**

  최대 CPU 시간(초).
**-u**

  단일 유저가 사용 가능한 프로세스의 최대 개수.
**-v**

  셸과 몇몇 시스템, 그리고 그 자식에서 사용 가능한 가상 메모리의 최대값.
**-x**

  파일 잠금의 최대 개수.
**-P**

  가상 터미널의 최대 개수.
**-R**

  실시간 프로세스에 블록 당하기 전에 실행될 최대 시간(마이크로초).
**-T**

  스레드의 최대 개수.

*limit*을 넘겼고, `-a` 옵션을 사용하지 않았다면 *limit*은 지정된 리소스의 새 값이 됩니다. *limit*에 넘길 수 있는 특수한 값으로는 `hard`, `soft`, `unlimited`가 있으며 각각 현재의 하드 리밋, 현재의 소프트 리밋, 그리고 무제한을 의미합니다. 하드 리밋은 한번 설정되면 루트 권한이 없는 유저는 증가시킬 수 없습니다. 소프트 리밋은 하드 리밋의 값까지 증가시킬 수 있습니다. 그 이외에는 `-H` 옵션을 넘기지 않았다면 지정된 소프트 리밋의 현재 값이 출력됩니다. 하나 이상의 리소스를 지정한 경우, 리밋 이름과 (적당한 것이 있다면) 단위가 값 앞에 출력됩니다. 새 리밋을 설정할 때 `-H`와 `-S`를 넘기지 않았다면 하드 리밋과 소프트 리밋이 모두 설정됩니다. 만약 넘긴 옵션이 없다면 `-f`를 넘겼다고 가정합니다. 값은 일반적으로 1024바이트 단위로 증가합니다. `-t`는 단위가 초이며, `-R`은 마이크로초, `-p`는 512바이트 블록입니다. `-P`, `-T`, `-b`, `-k`, `-n`, `-u`는 스케일이 없는 값입니다. POSIX 모드([Bash POSIX Mode](chapter_6_11.html)를 참조)에서 `-c`와 `-f`는 512바이트 단위로 증가합니다.

잘못된 옵션이나 인수를 넘기거나 새 리밋을 설정하는 동안 에러가 발생한 상황이 아니라면 종료 스테이터스는 0입니다.

**unalias**

```sh
unalias [-a] [name … ]
```
각 *name*을 별칭 리스트로부터 제거합니다. `-a`를 넘기면 모든 별칭을 제거합니다. 별칭에 대해서는 [Aliases](chapter_6_6.html)를 참조하세요.
