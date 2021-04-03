## 4.4 Special Builtins
역사적인 이유로 POSIX 표준은 몇몇 빌트인 명령어를 특수한 명령어로 분류했습니다. Bash는 POSIX 모드로 동작할 때, 이 특수 빌트인은 다른 빌트인 명령어들과 3가지 측면에서 다릅니다.

1. 특수 빌트인은 명령어 탐색 중에 셸 함수보다 먼저 검색됩니다.
2. 논-인터랙티브 셸은 특수 빌트인이 에러 스테이터스를 반환하면 종료됩니다.
3. 명령어 앞의 대입문이 명령어가 실행된 이후에도 셸 환경에 남아서 영향을 줍니다.

Bash가 POSIX 모드로 동작하고 있는 중이 아니라면, 이 빌트인들은 다른 Bash 빌트인 명령어들과 동일하게 동작합니다. Bash POSIX 모드는 [Bash POSIX Mode](chapter_6_11.html)에서 설명합니다.

다음은 POSIX 특수 빌트인입니다.

```
break : . continue eval exec exit export readonly return set
shift trap unset
```
