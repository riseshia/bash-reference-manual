### 3.5.1 Brace Expansion
중괄호 전개는 임의의 문자열을 생성할 수 있습니다. 이는 파일명 전개와 비슷하게 동작하지만, 생성된 파일명이 실제로 존재하지 않아도 됩니다. 패턴은 임의의 문자열로 시작할 수 있으며 중괄호로 감싼 쉼표로 구분된 문자열 또는 순서 표현식이 옵니다. 그 뒤에는 임의의 문자열이 올 수 있습니다. 중괄호 앞에 임의의 문자열이 있다면, 이는 중괄호 내부의 각 문자열의 접두사가 되며, 중괄호 뒤의 문자열은 각 문자열의 접미사가 됩니다. 전개는 왼쪽부터 오른쪽으로 순차로 진행됩니다.

중괄호 전개는 중첩될 수 있습니다. 전개된 각 문자열은 정렬되지 않습니다. 왼쪽에서 오른쪽으로의 순서는 보존됩니다. 예를 들어, 다음처럼 동작합니다.

```sh
bash$ echo a{d,c,b}e
ade ace abe
```

순서 표현식은 *{x..y[..incr]}* 의 형태를 가지며, *x*와 *y*는 숫자나 단일 문자입니다. 임의로 사용 가능한 증감자 *incr*는 정수입니다. 정수를 넘긴 경우, 표현식은 *x*부터 *y*까지 전개됩니다. '0'으로 시작하는 정수를 제공하여 각 단어가 같은 너비로 생성합니다. *x*나 *y*가 '0'으로 시작한다면, 셸은 생성된 모든 값이 같은 자릿수를 가지도록 필요에 따라 '0'을 접두사로 추가합니다. 문자를 넘긴 경우, 표현식을 기본 C 로케일을 사용하여 *x*부터 *y*까지 사전순으로 전개합니다. *x*와 *y*는 반드시 같은 타입이어야 합니다. 증감자가 있다면 이는 각 값의 차분으로 사용됩니다. 증감자의 기본값은 1이나 -1 중 적절한 값이 사용됩니다.

중괄호 전개는 다른 전개보다 먼저 실행되며, 다른 전개에서 사용되는 특별한 문자도 중괄호 전개 후에도 그대로 보존됩니다. 이는 원본 그대로입니다. Bash는 중괄호 사이의 텍스트나 전개의 컨텍스트에 어떠한 변경도 가하지 않습니다.

올바르게 구성된 중괄호 전개는 반드시 따옴표로 감싸지 않은 여는 중괄호와 닫는 중괄호를 반드시 가져야하며, 따옴표로 감싸지 않은 쉼표나 유효한 표현식을 가져야합니다. 올바르게 구성되지 않은 중괄호 전개는 적용되지 않습니다.

중괄호 전개의 일부로 취급되는 것을 막기 위해 `{`나 '`,`'를 백슬래시를 이용해 이스케이프할 수 있습니다. 매개변수 전개와의 충돌을 피하기 위해서 '`${`'는 중괄호 전개으로 인식되지 않으며, 닫는 중괄호가 나올때까지 중괄호 전개를 금지합니다.

이 구조는 위의 예제보다 긴 공통된 접두사를 가진 문자열을 생성하기 위한 간결한 표기로서 사용되는 경우가 많습니다. 다음은 예시입니다.

```sh
mkdir /usr/local/src/bash/{old,new,dist,bugs}
```

또는

```sh
chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}}
```