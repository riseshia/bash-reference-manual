### 6.3.1 What is an Interactive Shell?
인터랙티브 셸은 옵션 없이 실행하거나, `-s`와 `-c` 옵션을 지정하지 않고 실행하고 입력과 에러 출력이 모두 터미널과 연결되어 있거나(`isatty(3)`으로 판단) `-i` 옵션으로 실행한 셸입니다.

인터랙티브 셸은 일반적으로 유저의 터미널로부터 입력을 받고, 유저의 터미널에 출력합니다.

인터랙티브 셸을 실행할 때 `-s` 옵션을 사용하면 위치 매개변수를 설정할 수 있습니다.