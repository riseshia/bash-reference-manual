## 6.2 Bash Startup Files
이 섹션에서는 Bash가 자신의 기동 파일을 어떻게 실행하는지 설명합니다. 파일이 존재하지만 읽을 수 없는 경우, Bash는 에러를 보고합니다. 파일명에 포함된 물결줄표는 물결줄표 전개에서 설명한 대로 전개됩니다([Tilde Expansion](chapter_3_5_2.html)을 참조).

인터랙티브 셸에 대해서는 [Interactive Shells](chapter_6_3.html)를 참조하세요.

**Invoked as an interactive login shell, or with --login**

Bash를 인터랙티브 로그인 셸, 또는 `--login` 옵션과 함께 논-인터랙티브 셸로 실행할 때, Bash는 `/etc/profile`이 존재한다면 이 파일을 읽고 명령어를 실행합니다. 이 파일을 읽은 뒤, `~/.bash_profile`, `~/.bash_login`, `~/.profile`을 순서대로 찾은 뒤, 첫번째로 읽을 수 있는 파일을 발견하면 그것을 읽고 명령어를 실행합니다. `--noprofile` 옵션으로 셸이 시작할 때 이 동작을 하지 못하도록 만들 수 있습니다.

인터랙티브 로그인 셸이 종료할 때, 또는 논-인터랙티브 로그인 셸이 `exit` 빌트인 명령어를 실행할 때, Bash는 `~/.bash_logout` 파일이 존재하면 이 파일을 읽고 명령어를 실행합니다.

**Invoked as an interactive non-login shell**

인터랙티브 셸이 로그인 셸로 실행되지 않을 때, Bash는 `~/.bashrc`가 존재한다면 이 파일을 읽고 명령어를 실행합니다. 이 동작은 `--norc` 옵션을 사용해 금지할 수 있습니다. `--rcfile file` 옵션은 Bash에게 `~/.bashrc` 대신에 *file*을 읽고 명령어를 실행하도록 강제할 수 있습니다.

그러므로 보통 `~/.bash_profile`은 로그인 시에만 필요한 초기화 후(또는 전)에 다음의 줄을 포함합니다.

```sh
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
```

**Invoked non-interactively**

예를 들어, 셸 스크립트를 실행하기 위해 Bash를 논-인터랙티브 모드로 시작할 때, Bash는 환경에서 `BASH_ENV` 변수를 찾고, 존재한다면 해당 변수의 값을 전개하여 얻은 파일 이름을 읽고 실행합니다. Bash는 다음 명령어가 실행된 것처럼 행동합니다.

```sh
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
```

단, 파일명을 검색할 때 `PATH` 변수의 값은 사용되지 않습니다.

위에서 언급한 것처럼, 논-인터랙티브 셸이 `--login` 옵션과 함께 호출될 때, Bash는 로그인 셸 기동 파일로부터 읽은 명령어를 실행합니다.

**Invoked with name sh**

Bash를 `sh`라는 이름으로 호출하면 POSIX 표준을 준거하며 가능한 `sh`의 과거 버전의 기동 동작을 따라하려 합니다.

인터랙티브 로그인 셸로 실행될 때, 또는 `--login` 옵션으로 논-인터랙티브 셸로 실행될 때 `/etc/profile`과 `~/.profile`을 순서대로 읽으려고 시도하고, 있다면 명령어를 실행합니다. `--noprofile` 옵션으로 이 동작을 금지할 수 있습니다. 인터랙티브 셸을 `sh`라는 이름으로 실행할 때, Bash는 환경에서 `ENV` 변수를 찾고 만약 있다면 이 변수의 값을 전개해 얻은 값을 파일명으로 하는 파일을 읽고 실행합니다. `sh`로 실행된 셸은 다른 기동 파일로부터 명령어를 읽고 실행하려 시도하지 않으므로, `--rcfile` 옵션은 의미가 없습니다. `sh`라는 이름으로 실행한 논-인터랙티브 셸은 기동 파일을 읽지 않습니다.

`sh`로 실행할 때 Bash는 기동 파일을 읽고난 후 POSIX 모드로 동작합니다.

**Invoked in POSIX mode**

Bash를 `--posix` 커맨드 라인 옵션을 사용해서 POSIX 모드로 실행하면 POSIX 표준대로 기동 파일을 읽습니다. 이 모드에서는 인터랙티브 셸은 `ENV` 변수를 전개하여 얻은 값을 파일명으로 하는 파일로부터 명령어를 읽고 실행합니다. 다른 기동 파일은 읽히지 않습니다.

**Invoked by remote shell daemon**

Bash는 리모트 셸 데몬(일반적으로는 `rshd`)나 보안 셸 데몬 `sshd`로 실행되었을 때, 표준입력이 네트워크에 접속된 상태로 실행중인지 아닌지 판단하려 합니다. Bash가 만약 이 방식대로 실행중이라고 판단하고 `~/.bashrc`를 읽을 수 있다면 이 파일로부터 명령어를 읽고 실행합니다. 만약 `sh`로서 호출되었다면 이 동작은 실행되지 않습니다. `--norc` 옵션은 이 동작을 금지할 수 있으며, `--rcfile` 옵션은 다른 파일을 읽도록 강제할 수 있습니다만, `rshd`나 `sshd`는 일반적으로 이러한 옵션을 지정해서 셸을 실행할 수 없습니다.

**Invoked with unequal effective and real UID/GIDs**

Bash가 실제 유저(그룹) id와 다른 유효한 유저(그룹) id로 실행되고, `-p` 옵션을 넘기지 않았다면 기동 파일을 읽지 않으며 셸 함수는 환경으로부터 상속되지 않습니다. `SHELLOPTS`, `BASHOPTS`, `CDPATH`, `GLOBIGNORE` 변수가 환경에 있었다면 무시하며 유효한 유저 id에 실제 유저 id를 설정합니다. 만약 호출시에 `-p` 옵션을 넘겼다면 기동 동작은 동일하지만 유효한 유저 id를 초기화하지 않습니다.
