## 6.1 Invoking Bash
```sh
bash [long-opt] [-ir] [-abefhkmnptuvxdBCDHP] [-o option]
    [-O shopt_option] [argument …]
bash [long-opt] [-abefhkmnptuvxdBCDHP] [-o option]
    [-O shopt_option] -c string [argument …]
bash [long-opt] -s [-abefhkmnptuvxdBCDHP] [-o option]
    [-O shopt_option] [argument …]
```

`set` 빌트인([The Set Builtin](chapter_4_3_1.html)을 참조)에서 사용할 수 있는 모든 단일 문자 옵션을 셸을 호출할 때 사용할 수 있습니다. 추가로 여러 문자로 된 몇몇의 옵션도 사용할 수 있습니다. 이 옵션은 단일 문자 옵션보다 먼저 지정해야 합니다.

**--debugger**

셸을 실행하기 전에 디버거 프로파일을 실행하도록 준비합니다. 확장된 디버깅 모드를 켭니다(`shopt` 빌트인의 `extdebug` 옵션의 설명에 대해서는 [The Shopt Builtin](chapter_4_3_2.html)을 참조).
**--dump-po-strings**

'`$`'로 시작하는 모든 큰따옴표 문자열의 리스트를 표준 출력에 GNU `gettext` PO(portable object) 파일 형식으로 출력합니다. 출력 형식을 제외하면 `-D`와 동일합니다.
**--dump-strings**

`-D`와 동일합니다.
**--help**

표준 출력에 사용법을 출력하고 성공적으로 종료합니다.
**--init-file filename**

**--rcfile filename**

인터랙티브 셸에서 (`~/.bashrc` 대신)*filename*로부터 명령어를 실행합니다.
**--login**

`-l`과 동일합니다.
**--noediting**

인터랙티브 모드에서 동작 중에 커맨드라인을 읽어들일 때 GNU Readline library([Command Line Editing](chapter_8.html)을 참조)를 사용하지 않습니다.
**--noprofile**

Bash가 로그인 셸로 호출될 때, 시스템 전체의 기동 파일인 `/etc/profile`이나 다른 개인용 초기화 파일인 `~/.bash_profile`, `~/.bash_login`, `~/.profile`을 로드하지 않습니다.
**--norc**

인터랙티브 셸에서 `~/.bashrc` 초기화 파일을 읽지 않습니다. 이 옵션의 기본값은 셸이 `sh`로 호출될 때에만 켜짐입니다.
**--posix**

POSIX 표준과 다른 Bash의 기본 동작을 표준에 일치하도록 변경합니다. 이는 Bash가 표준의 엄격한 슈퍼셋으로 동작하도록 만드는 것이 목적입니다. Bash의 POSIX 모드에 대한 설명은 [Bash POSIX Mode](chapter_6_11.html)를 참조하세요.
**--restricted**

셸을 한정 모드로 만듭니다([The Restricted Shell](chapter_6_10.html)을 참조).
**--verbose**

`-v`와 동일합니다. 읽어들인 입력 줄을 출력합니다.
**--version**

Bash 인스턴스의 버전 정보를 표준 출력에 출력하고 성공적으로 종료합니다.

`set` 빌트인에서는 사용할 수 없지만 실행시에 넘길 수 있는 단일 문자 옵션이 몇 개 존재합니다.

**-c**

옵션이 아닌 첫번째 인수 *command_string*을 읽고 실행한 뒤 종료합니다. 만약 *command_string* 뒤에 인수가 존재한다면 첫번째 인수는 `$0`에 대입되고, 나머지 인수들은 위치 매개변수에 대입됩니다. `$0`에 대입된 값은 셸의 이름을 설정하며, 이는 경고, 에러 메시지에 사용됩니다.
**-i**

셸을 인터랙티브 모드에서 실행합니다. 인터랙티브 셸에 대한 설명은 [Interactive Shells](chapter_6_3.html)를 참조하세요.
**-l**

셸이 로그인에 의해 직접 호출된 것처럼 동작하게 만듭니다. 셸이 인터랙티브 모드라면 이는 '`exec -l bash`'로 로그인 셸을 시작하는 것과 동일합니다. 만약 셸이 인터랙티브 모드가 아니라면 로그인 셸의 기동 파일이 실행됩니다. '`exec bash -l`'이나 '`exec bash --login`'은 현재 셸을 Bash 로그인 셸로 대체합니다. 로그인 셸의 특수한 동작에 대한 설명은 [Bash Startup Files](chapter_6_2.html)를 참조하세요.
**-r**

셸을 한정 모드로 만듭니다([The Restricted Shell](chapter_6_10.html)을 참조).
**-s**

이 옵션이 있거나 옵션 처리를 진행했지만 아무 옵션이 없었다면 표준 입력으로부터 명령어를 읽어옵니다. 이 옵션은 인터랙티브 셸을 호출할 때, 파이프를 통해 입력을 읽어올 때 위치 매개변수를 설정할 수 있습니다.
**-D**

'`$`'로 시작하는 모든 큰따옴표 문자열의 리스트를 표준 출력에 출력합니다. 이 문자열들은 현재 로케일이 `C`나 `POSIX`가 아니라면 번역의 적용을 받습니다(Local Translation을 참조). 이는 `-n` 옵션을 포함합니다. 그러므로 어떤 명령어도 실행되지 않습니다.
**[-+]O [*shopt_option*]**

*shopt_option*은 `shopt` 빌트인([The Shopt Builtin](chapter_4_3_2.html)을 참조)이 받을 수 있는 셸 옵션 중 하나입니다. 만약 *shopt_option*이 있다면, `-O`는 해당 옵션의 값을 설정하고, `+O`는 값을 제거합니다. *shopt_option*을 넘기지 않았다면 `shopt`가 받을 수 있는 셸 옵션의 이름과 값 리스트가 표준 출력에 출력됩니다. 호출 옵션이 `+O`라면 결과는 입력으로 재활용 가능한 형식으로 출력됩니다.
**--**

`--`은 옵션의 끝을 나타내며 이후의 옵션 처리를 멈추도록 합니다. `--` 이후의 인수는 파일명과 일반 인수로 취급됩니다.

*로그인* 셸은 0번째 인수의 첫번째 문자가 '-'이거나, `--login` 옵션으로 호출합니다.

*인터랙티브*셸은 옵션 없이 호출하거나, `-s`, `-c` 옵션 없이 호출하고 입력과 출력이 모두 터미널에 연결되어 있거나(`isatty(3)`으로 판단) `-i` 옵션으로 호출합니다. 추가 설명은 [Interactive Shells](chapter_6_3.html)를 참조하세요.

옵션 처리 이후에도 인수가 남아있고 `-c`와 `-s` 옵션을 사용하지 않았다면 첫번째 인수는 셸 명령어를 포함하고 있는 파일([Shell Scripts](chapter_3_8.html)를 참조)이라고 인식합니다. Bash는 이런 방식으로 호출할 때 `$0`을 파일 명으로 설정하고, 나머지 인수를 위치 매개변수로 설정합니다. Bash는 이 파일로부터 명령어를 읽고 실행한 뒤 종료합니다. Bash의 종료 스테이터느는 스크립트에서 마지막으로 실행된 명령어의 종료 스테이터스입니다. 만약 실행된 명령어가 없다면 종료 스테이터스는 0입니다.