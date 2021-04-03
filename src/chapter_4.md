# 4. Shell Builtin Commands
빌트인 명령어는 셸 자체에 포함되어 있습니다. 빌트인 명령어의 이름이 단순 명령어([Simple Commands](chapter_3_2_2.html)를 참조)의 첫번째 단어로 사용되는 경우, 셸은 다른 프로그램을 호출하지 않고 명령어를 직접 실행합니다. 빌트인 명령어는 별도의 유틸리티로는 기술적으로 실현 불가능한 것이나 불편한 것을 구현하기 위해 필요합니다.

이 섹션에서는 Bash가 Bourne Shell로부터 계승한 빌트인 명령어와 Bash에만 존재하거나 기능을 확장한 명령어에 대해서 간략하게 설명합니다.

Bash 인터페이스에 잡 컨트롤 기능([Job Control Builtins](chapter_7_2.html)를 참조), 디렉터리 스택([Directory Stack Builtins](chapter_6_8_1.html)를 참조), 명령어 이력(Bash History Builtins를 참조), 프로그래밍 가능한 완성 기능([Programmable Completion Builtins](chapter_8_7.html)을 참조)을 제공해주는 빌트인 명령어는 다른 장에서 설명합니다. 

 많은 빌트인 명령어는 POSIX나 Bash에 의해서 기능이 추가되었습니다.

따로 언급하지 않는다면, 설명에서 '-'로 시작하는 옵션을 받는 각 빌트인 명령어는 옵션의 끝을 표시하는 '--'를 사용할 수 있습니다. `:`, `true`, `false`, `test`/`[`는 옵션을 받지 않으며, '--'를 특별 취급하지도 않습니다. `exit`, `logout`, `return`, `break`, `continue`, `let`, `shift` 빌트인 명령어는 '--' 없이 '-'로 시작하는 인수를 받을 수 있습니다. 인수를 받지만 옵션을 사용할 수 없는 다른 빌트인 명령어는 '-'로 시작하는 인수를 잘못된 옵션으로 해석하므로 이를 피하기 위해서는 '--'를 사용해야 합니다.
