## 3.5 Shell Expansions

전개는 명령줄이 토큰으로 분해된 이후에 발생합니다. 실행되는 전개는 7종류입니다.

- [Brace Expansion](chapter_3_5_1.html) : 중괄호 안의 표현식 전개.
- [Tilde Expansion](chapter_3_5_2.html) : ~ 문자 전개.
- [Shell Parameter Expansion](chapter_3_5_3.html) : Bash가 변수를 값으로 전개하는 방법.
- [Command Substitution](chapter_3_5_4.html) : 명령어의 출력을 인수로 사용하기.
- [Arithmetic Expansion](chapter_3_5_5.html) : 셸 전개에서 산술 계산을 사용하는 방법.
- [Process Substitution](chapter_3_5_6.html) : 명령어로부터 읽고 쓰는 방법.
- [Word Splitting](chapter_3_5_7.html) : 전개의 결과를 별개의 인수로 분리하는 방법.
- [Filename Expansion](chapter_3_5_8.html) : 파일명 일치 패턴을 지정하는 간결한 방법.
- [Quote Removal](chapter_3_5_9.html) : 따옴표 문자와 이스케이프 문자가 단어로부터 언제, 어떻게 제거되는지.

전개는 중괄호 전개, 물결줄표 전개, 매개변수와 변수 전개, 산술 전개, 명령어 치환(왼쪽부터 처리됩니다), 단어 분리, 파일명 전개 순서로 이루어집니다. 

지원하는 시스템에 한정하여 프로세스 치환도 사용가능합니다. 이는 물결줄표, 매개변수 변수, 산술 전개과 명령어 치환과 같은 시점에 실행됩니다.

이러한 전개들이 실행된 뒤, 원래의 단어에 나타나는 따옴표는 자신을 수식하는 경우를 제외하고 삭제됩니다(따옴표 제거).

중괄호 전개, 단어 분리, 파일명 전개에서만 전개의 결과로 단어 숫자가 증가할 수 있습니다. 다른 전개에서는 단일 단어를 단일 단어로만 전개합니다. 단, `"$@"`와 `$*`, `"${name[@]}"`, `${name[*]}`는 이 규칙의 예외입니다.

모든 전개가 끝나면 따옴표 제거가 실행됩니다.