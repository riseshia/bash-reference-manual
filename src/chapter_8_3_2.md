### 8.3.2 Conditional Init Constructs
Readline은 C의 전처리기의 조건부 컴파일 기능과 유사한 기능이 구현되어있어서 테스트의 결과로 키 바인딩이나 변수를 설정할 수 있습니다. 사용하는 파서 디렉티브는 4개가 있습니다.

**$if**

`$if` 구조를 사용해서 편집 모드, 사용중인 터미널, Readline을 사용하는 애플리케이션에 기초해 바인딩할 수 있습니다. 비교 연산자 뒤에 오는 테스트의 텍스트는 줄의 끝까지 전개됩니다. 따로 언급하지 않는다면 테스트를 구분하기 위한 문자는 필요 없습니다.

- **mode**

  `$if` 디렉티브의 `mode=` 형식은 Readline이 `emacs` 모드인지 `vi` 모드인지 검사할 때 사용합니다. 이는 '`set keymap`' 명령어와 함께 사용하여, 예를 들면 Readline이 `emacs` 모드로 시작한 경우에만 `emacs-standard`와 `emacs-ctls` 키 맵 바인딩을 설정할 수 있습니다.
- **term**

  `term=` 형식은 터미널 고유의 키 바인딩을 포함하기 위해서 사용합니다. 예를 들어 터미널의 펑선 키에 의해서 출력되는 키 나열을 바인딩할 수 있습니다. '='의 오른쪽 피연산자의 단어는 터미널의 완전한 이름과 첫 '-' 앞에 오는 터미널 이름, 둘 모두에 대해 검사됩니다. 이를 통해 `sun`은 `sun`과 `sun-cmd` 모두와 일치합니다.
- **version**

  `version` 테스트는 특정 Readline 버번에 대해서 비교를 실행할 때 사용합니다. `version`은 현재 Readline 버전으로 전개됩니다. 비교 연산자의 집합은 '='(그리고 '=='), '!=', '<=', '>=', '<', '>'를 포함합니다. 오른쪽 피연산자에 사용하는 버전 번호는 메이저 버전 번호(소수를 사용할 수 있습니다), 선택적인 마이너 버전으로 구성됩니다(e.g., '7.1'). 마이너 버전을 생략하면 '0'이라고 간주합니다. 연산자는 문자열 `version`, 버전 번호 인수와 공백으로 구분할 수 있습니다. 다음 예제는 Readline 버전이 7.0 이상일 때 변수를 설정합니다.
  ```sh
  $if version >= 7.0
  set show-mode-in-prompt on
  $endif
  ```
- **application**

  *application* 구조는 애플리케이션 고유의 설정을 포함하기 위해서 사용합니다. Readline 라이브러리를 사용하는 각 프로그램은 *application name*을 설정하므로 이 값을 검사할 수 있습니다. 이는 특정 프로그램에서 유용한 함수에 키 나열을 바인딩할 수 있도록 해줍니다. 예를 들어 다음 명령어는 Bash에서 현재 또는 이전 단어를 감싸는 키 나열을 추가합니다.
  ```sh
  $if Bash
  # Quote the current or previous word
  "\C-xq": "\eb\"\ef\""
  $endif
  ```
- **variable**

  *variable* 구조는 Readline 변수와 값에 대한 간단한 등치 검사를 제공합니다. 사용할 수 있는 비교 연산자는 '=', '==', '!='입니다. 변수 이름은 반드시 비교 연산자와 공백으로 구분되어야 합니다. 연산자는 오른쪽 피연산자와 공백으로 구분될 수 있습니다. 문자열과 불린 변수 모두 검사할 수 있습니다. 불린 변수는 *on*, *off*와 비교되어야 합니다. 다음 예제는 위에서 설명한 `mode=emacs` 검사와 동일합니다.
  ```sh
  $if editing-mode == emacs
  set show-mode-in-prompt on
  $endif
  ```

**$endif**

이 명령어는 위에서 보았듯이 `$if` 명령어를 종료합니다.

**$else**

`$if` 디렉티브의 이 분기에 있는 명령어는 테스트에 실패할 때 실행됩니다.

**$include**

이 디렉티브는 단일 파일명을 인수로 받고 이 파일로 부터 명령어와 바인딩을 읽습니다. 예를 들어 다음 디렉티브는 `/etc/inputrc`를 읽습니다.

```sh
$include /etc/inputrc
```
