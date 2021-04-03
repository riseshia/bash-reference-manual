## 8.2 Readline Interaction
인터랙티브 세션에서 긴 텍스트를 입력하는 동안 줄의 첫 번째 단어가 틀렸다는 것을 발견할 때가 자주 있습니다. Readline 라이브러리는 입력중인 텍스트를 조작할 수 있는 명령어 집합을 제공하고 있으며 줄 전체를 다시 입력할 필요 없이 오탈자만 고칠 수 있도록 해줍니다. 편집 명령어를 사용해서 커서를 수정이 필요한 곳에 이동시키고 수정할 텍스트를 지우거나 추가할 수 있습니다. 그리고 문제 없음을 확인했을 때 그저 `RET`를 누르면 됩니다. 줄의 끝으로 이동해서 `RET`을 누를 필요는 없습니다. 줄 내부에 있는 커서의 위치에 관계 없이 전체 줄이 처리됩니다.

- [Readline Bare Essentials](chapter_8_2_1.html) : Readline에 대해서 알아야 할 최소한의 정보.
- [Readline Movement Commands](chapter_8_2_2.html) : 입력 줄에서 움직이기.
- [Readline Killing Commands](chapter_8_2_3.html) : 텍스트를 지우고 복구하는 방법.
- [Readline Arguments](chapter_8_2_4.html) : 명령어에 숫자 인수를 넘기기.
- [Searching for Commands in the History](chapter_8_2_5.html) : 이전 줄들을 통해 검색하기.
