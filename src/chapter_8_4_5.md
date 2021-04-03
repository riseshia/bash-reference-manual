### 8.4.5 Specifying Numeric Arguments
**digit-argument (*M-0*, *M-1*, … *M--*)**

이미 축적중인 인수에 이 숫자를 추가하거나 새 인수를 시작합니다. *M--*는 음의 인수를 시작합니다.

**universal-argument ()**

인수를 지정하는 또 하나의 방법입니다. 이 명령어 뒤에 하나 이상의 숫자(마이너스 기호로 시작할 수 있습니다)가 따라오면 넘긴 숫자는 인수를 정의합니다. 명령어 뒤에 숫자가 따라오는 경우, `universal-argument`를 재실행하면 숫자 인수 입력이 종료됩니다만, 그 이외의 경우에는 무시됩니다. 특수한 경우로 명령어 직후에 숫자나 마이너스 기호가 아닌 문자가 따라오면 다음 명령어의 인수 숫자는 4배가 됩니다. 인수 개수는 처음엔 1이므로 이 함수를 처음 실행하면 인수 개수는 4가 되고, 두번째 실행하면 16이 되는 식입니다. 기본 설정에서 이 명령어에 바인딩된 키는 없습니다.