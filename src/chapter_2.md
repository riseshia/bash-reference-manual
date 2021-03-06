# 2. Definitions
다음 정의들은 뒷부분에서 사용됩니다.

- `POSIX`: 유닉스 기반의 공개 시스템 표준. Bash는 주로 POSIX 1003.1 표준의 셸과 유틸리티 부분에 관련이 있습니다.
- `공백`: 스페이스나 탭 문자.
- `빌트인`: 파일 시스템 어딘가에 존재하는 실행 가능한 프로그램이 아닌, 셸 자신에 의해서 내부적으로 구현된 명령어.
- `제어 연산자`: 제어 함수를 실행하는 토큰. 개행이나 다음 중 하나입니다. `::`, `&&`, `&`, `;`, `;;`, `;&`, `;;&`, `|`, `|&`, `(`, `)`.
- `종료 스테이터스`: 명령이 호출자에게 반환하는 값. 이 값은 8비트로 제한되어 있으며, 그러므로 최대값은 255입니다.
- `필드`: 셸 전개의 결과물로서 나타나는 문자열의 한 부분. 전개 후, 명령을 실행할 때 필드들은 명령어의 이름과 인수로 사용됩니다.
- `파일명`: 파일을 식별하기 위해 사용되는 문자열.
- `잡`: 파이프라인을 구성하는 프로세스의 집합과 이들의 자식 프로세스들. 이들은 전부 동일한 프로세스 그룹에 포함됩니다.
- `잡 컨트롤`: 프로세스들의 정지(서스펜드)하거나, 재시작(재개)할 수 있게끔 하는 구조
- `메타문자`: 따옴표를 제거했을 때 단어로 분리되는 문자들. 메타 문자는 스페이스, 탭, 개행이나 다음 중 하나입니다 `|`, `&`, `;`, `(`, `)`, `<`, `>`
- `이름`: 영문자, 숫자, 언더스코어로 구성되며, 영문자나 언더스코어로 시작되는 단어. 이름들은 셸의 변수나 함수명으로 사용된다. `식별자`라고도 부릅니다.
- `연산자`: `제어 연산자`나 `리다이렉션 연산자`. 리다이렉션 연산자에 대해서는 [Redirections](chapter_3_6.html)를 참조하세요. 연산자는 적어도 하나의 따옴표가 제거된 메타문자를 포함하세요.
- `프로세스 그룹`: 같은 프로세스 그룹 ID를 가지고 있는 프로세스 집합.
- `프로세스 그룹 ID`: 프로세스 그룹의 생애주기 동안 이를 가리키는 유일한 식별자.
- `예약어`: 셸에서 특별한 의미를 가지는 단어. `for`, `while` 같은 대부분의 예약어는 흐름 제어 구조에서 소개됩니다.
- `반환 스테이터스`: 종료 스테이터스와 동의어.
- `시그널`: 커널이 시스템에서 발생한 이벤트를 프로세스에게 알리기 위한 구조.
- `특수 빌트인`: POSIX에서 특별한 것으로 분류되는 셸의 내장 명령어.
- `토큰`: 셸에서 하나의 단위로 인식되는 연속된 문자들. 단어이거나 연산자.
- `단어`: 셸에서 하나의 단위로 처리되는 연속된 문자들. 단어는 따옴표가 제거된 메타문자를 포함하지 않을 수도 있습니다.
