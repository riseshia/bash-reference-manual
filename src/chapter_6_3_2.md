### 6.3.2 Is this Shell Interactive?
기동 스크립트에서 Bash가 인터랙티브 모드에서 실행중인지 아닌지 판단하고 싶을 때에는 '`-`' 특수 매개변수의 값을 검사하세요. 셸이 인터랙티브 모드라면 이 값은 `i`를 포함합니다. 다음은 예시입니다.

```sh
case "$-" in
*i*)	echo This shell is interactive ;;
*)	echo This shell is not interactive ;;
esac
```

또는 이 대신에 기동 스크립트는 `PS1` 변수를 검사할 수 있습니다. 이 변수는 논-인터랙티브 셸이라면 설정되지 않으며, 인터랙티브 셸일 때에 설정됩니다. 그러므로 다음처럼 사용할 수 있습니다.

```sh
if [ -z "$PS1" ]; then
        echo This shell is not interactive
else
        echo This shell is interactive
fi
```
