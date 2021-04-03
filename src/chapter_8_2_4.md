### 8.2.4 Readline Arguments
Readline 명령어에 숫자 인수를 넘길 수도 있습니다. 인수는 반복 횟수로 동작하거나 인수의 *부호*로 동작할 때도 있습니다. 일반적으로 순방향으로 동작하는 명령어에 음의 인수를 넘기면 명령어는 역방향으로 동작합니다. 예를 들어, 커서로부터 텍스트의 시작 부분까지를 잘라내고 싶다면 'M-- C-k'를 타이핑합니다.

명령어에 숫자 인수를 넘기는 일반적인 방법은 명령어 전에 메타 숫자를 타이핑하는 것입니다. 첫번째로 입력할 숫자가 마이너스 기호('-')라면, 인수의 부호는 마이너스가 됩니다. 인수를 시작할 때 메타 숫자를 한번 입력하면 숫자의 나머지를 입력할 수 있고, 그 후에 명령어를 입력할 수 있습니다. 예를 들어 *C-d* 명령어의 인수로 10을 넘기고 싶다면 'M-1 0 C-d'를 타이핑하세요. 이는 입력 줄에서 다음 문자 10개를 지웁니다.