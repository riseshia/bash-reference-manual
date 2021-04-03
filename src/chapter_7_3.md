## 7.3 Job Control Variables
**auto_resume**

이 변수는 셸이 유저와 잡 컨트롤과 어떻게 상호작용할지 제어합니다. 이 변수가 존재한다면 리다이렉션이 없고 한 단어로 구성된 단순 명령어는 존재하고 있는 잡의 재개 후보로 취급됩니다. 여기에서는 모호함이 금지됩니다. 입력된 문자열로 시작하는 잡이 하나 이상 존재하면 가장 최근에 접근한 잡이 선택됩니다. 이 컨텍스트에서 중단된 잡의 이름이란 해당 잡을 시작하기 위해 사용한 커맨드 라인을 가리킵니다. 이 변수에 'exact'라는 값이 설정되어 있다면 넘긴 문자열은 중단된 잡의 이름과 정확히 일치해야 합니다. 'substring'이라면 넘긴 문자열은 중단된 잡의 이름의 부분 문자열과 일치해야합니다. 'substring' 값은 '%?' 잡 ID와 유사한 기능을 제공합니다([Job Control Basics](chapter_7_1.html)를 참조). 그 이외의 값으로 설정하면 제공된 문자열은 중단된 잡의 이름의 접두사여야 합니다. 이 동작은 '%' 잡 ID와 유사한 기능을 제공합니다.