## 8.6 Programmable Completion
`complete` 빌트인([Programmable Completion Builtins](chapter_8_7.html)를 참조)을 사용해 완성 명세(*compspec*)가 정의된 명령어의 인수에 단어 완성을 시도할 때, 프로그래밍 가능한 완성 기능이 호출됩니다.

첫번째로 명령어의 이름이 식별됩니다. 명령어의 완성 명세가 정의되어 있다면, 완성 명세는 단어의 완성 후보 목록을 생성할 때 사용됩니다. 명령어 단어가 빈 문자열(빈 줄의 시작에서 완성을 시도하는 경우)이라면, `complete`에 `-E` 옵션을 넘기며 정의된 완성 명세가 사용됩니다. 명령어 단어가 완전한 경로라면, 완전한 경로에 대한 완성 명세가 존재하는지 먼저 찾습니다. 완전한 경로에 대한 완성 명세가 존재하지 않는다면, 마지막 슬래시 뒷부분을 사용하여 완성 명세를 찾으려 시도합니다. 이 검색에서도 완성 명세를 발견하지 못했다면 `complete`에 `-D` 옵션을 넘기며 정의된 완성 명세가 기본값으로 사용됩니다. 기본으로 사용할 수 있는 완성 명세가 없다면, Bash는 마지막 수단으로 명령어 단어에 대해 별칭 전개를 시도하고 성공한 전개 결과로부터 명령어의 완성 명세를 찾으려 시도합니다.

일단 완성 명세를 발견했다면 일치하는 단어 목록을 생성할 때 사용됩니다. 완성 명세를 찾지 못했다면 이전에 설명한 Bash의 기본 완성 기능([Commands For Completion](chapter_8_4_6.html)을 참조)이 실행됩니다.

먼저 완성 명세에 지정된 액션이 사용됩니다. 완성 대상인 단어가 접두사로 일치하는 것만이 반환됩니다. 파일명이나 디렉터리명 완성에 `-f`나 `-d` 옵션을 사용할 때, 셸은 `FIGNORE` 변수를 사용해 일치 결과를 필터링합니다. `FIGNORE`에 대해서는 [Bash Variables](chapter_5_2.html)를 참조하세요.

`-G` 옵션에 넘긴 파일명 전개 패턴으로 식별된 완성이 다음으로 생성됩니다. 패턴에 의해 생성된 단어는 완성 대상 단어와 일치할 필요가 없습니다. `GLOBIGNORE` 셸 변수는 일치 결과를 필터링할 때 사용되지 않습니다만, `FIGNORE` 셸 변수는 사용됩니다.

그 다음으로 `-W` 옵션에 넘긴 인수 문자열을 검토합니다. 먼저, `IFS` 특수 변수의 문자들을 구분자로 사용해 문자열을 분할합니다. 셸의 메타 문자나 `IFS`의 값이 포함된 문자열을 사용 할 수 있도록 셸의 따옴표 감싸기가 적용됩니다. 각 단어는 이전에 설명했던 중괄호 전개, 물결줄표 전개, 매개변수와 변수 전개. 명령어 치환, 산술 전개를 사용해 전개됩니다([Shell Expansions](chapter_3_5.html)를 참조). 전개된 결과는 이전에 설명한 규칙([Word Splitting](chapter_3_5_7.html)을 참조)을 사용해 분할됩니다. 전개의 결과는 완성 대상 단어와 앞 부분이 일치하며 일치한 단어는 완성 후보가 됩니다.

일치 리스트가 생성된 후, `-F`와 `-C` 옵션으로 지정한 셸 함수나 명령어가 호출됩니다. 명령어나 함수가 호출될 때 이전에 설명했던 것처럼 `COMP_LINE`, `COMP_POINT`, `COMP_KEY`, `COMP_TYPE` 변수에 값이 대입됩니다([Bash Variables](chapter_5_2.html)를 참조). 셸 함수가 호출되었다면 `COMP_WORDS`와 `COMP_CWORD`도 설정됩니다. 함수나 명령어가 호출되었다면 첫번째 인수(`$1`)는 인수를 완성하고 싶은 명령어의 이름이며, 두번째 인수(`$2`)는 완성 대상인 단어이고 세번째 인수(`$3`)는 현재 커맨드 라인에서 완성을 시도하고 있는 단어의 앞 단어입니다. 완성 대상에 대해서 생성된 완성 후보에는 어떤 필터링도 적용되지 않습니다. 함수나 명령어는 완전히 자유롭게 일치 리스트를 생성할 수 있습니다.

`-F` 옵션으로 지정한 함수가 먼저 호출됩니다. 함수는 아래에서 설명할 `compgen`과 `compopt` 빌트인([Programmable Completion Builtins](chapter_8_7.html)를 참조)을 포함하는 셸의 기능을 사용해 일치 리스트를 생성할 수 있습니다. 함수는 `COMPREPLY` 배열 변수에 완성 후보를 한 인덱스에 한 개씩 추가해야 합니다.

다음으로, `-C` 옵션으로 지정한 명령어가 명령어 치환과 동일한 환경에서 호출됩니다. 이 명령어는 완성 리스트를 한 줄에 하나씩 표준 출력으로 출력해야 합니다. 필요하다면 백슬래시는 개행을 이스케이프하세요.

모든 완성 후보가 생성된 이후에 `-X` 옵션으로 지정한 필터가 리스트에 적용됩니다. 필터는 경로명 전개에서 사용되는 패턴과 같습니다. 패턴의 '&'는 완성 대상인 단어의 텍스트로 대체됩니다. '&' 리터럴은 백슬래시로 이스케이프할 수 있습니다. 백슬래시는 일치를 시도하기 전에 제거됩니다. 패턴에 일치하는 후보는 리스트에서 제거됩니다. 첫머리의 '!'는 부정 패턴을 의미하며, 이 경우 패턴에 일치하지 않는 후보가 제거됩니다. `nocasematch` 셸 옵션([The Shopt Builtin](chapter_4_3_2.html)의 `shopt` 설명을 참조)이 켜져있다면, 일치 검사에서 알파벳의 대소문자를 고려하지 않습니다.

마지막으로 `-P`와 `-S` 옵션으로 각각 지정된 접두사와 접미사를 완성 리스트의 각 구성원에 추가한 뒤, Readline 완성 코드에게 완성 후보 리스트로 반환합니다.

이전에 적용된 액션에서 일치하는 것이 아무것도 없고, 완성 명세를 정의할 때 `complete`에 `-o dirnames` 옵션을 넘겼다면 디렉터리명 완성을 시도합니다.

완성 명새를 정의할 때 `complete`에 `-o plusdirs` 옵션을 넘겼다면, 디렉터리명 완성을 시도한 뒤, 다른 액션의 결과에 이를 추가합니다.

기본 설정에서 완성 명세를 발견하면, 명세가 무엇을 생성하든 완성 코드에게 결과를 완전한 완선 후보 집합으로 반환합니다. 기본 Bash 완성은 시도되지 않으며 Readline의 기본 파일명 완성도 비활성화됩니다. 완성 명세를 정의할 때 `complete`에 `-o bashdefault` 옵션을 넘겼다면, 완성 명세가 빈 결과를 생성할 때 기본 Bash 완성을 시도합니다. 완성 명세를 정의할 때 `complete`에 `-o default` 옵션을 넘겼다면 완성 명세가 빈 결과(기본 Bash 완성을 시도했다면 이 완성 결과도 포함)를 생성할 때 Readline의 기본 완성을 시도합니다.

완성 명세가 디렉터리명 완성이 필요하다고 지시했을 때, 완성된 이름이 디렉터리를 가리키는 심볼릭 링크라면 프로그래밍 가능한 완성 기능은 Readline를 통해 뒤에 슬래시를 추가합니다. 이 때 *mark-directories* Readline 변수의 적용을 받습니다만, *mark-symlinked-directories* Readline 변수의 설정은 무시합니다.

동적으로 완성을 수정하기 위한 기능이 있습니다. 이는 `-D`로 지정된 기본 완성과 함께 사용될 때 가장 유용합니다. 완성 핸들러로 실행된 셸 함수가 124 종료 스테이터스를 반환하여 완성을 재시도해야한다고 알릴 수 있습니다. 셸 함수가 124를 반환하고 방금 시도되었던 명령어(함수가 실행될 때 첫번째 인수로 넘겨집니다)에 연결된 완성 명세를 변경했다면, 프로그래밍 가능한 완성은 처음부터 다시 시작하여 해당 명령어의 새 완성 명세를 찾으려 시도합니다. 이는 한번에 모두 읽어들이기 보다는 완성이 시도되었을 때 완성의 집합을 동적으로 생성할 수 있도록 해줍니다.

예를 들어 완성 명세의 라이브러리가 있고, 각 파일은 그에 대응하는 명령어의 이름을 가지고 있다고 가정합시다. 다음 기본 완성 함수는 완성을 동적으로 불러옵니다.

```sh
_completion_loader()
{
    . "/etc/bash_completion.d/$1.sh" >/dev/null 2>&1 && return 124
}
complete -D -F _completion_loader -o bashdefault -o default
```