### 8.4.2 Commands For Manipulating The History
**accept-line (Newline 또는 Return)**

커서가 어디에 있든 관계없이 줄의 입력을 종료합니다. 줄이 비어있지 않다면, 이를 `HISTCONTROL`과 `HISTIGNORE` 변수 설정에 따라 이력 리스트에 추가합니다. 줄이 수정된 이력 줄이라면 이력 줄을 원래 상태로 복구합니다.

**previous-history (C-p)**

이력 리스트에 들어 있는 이전 명령어를 가져옵니다.

**next-history (C-n)**

이력 리스트에 들어 있는 다음 명령어를 가져옵니다.

**beginning-of-history (M-<)**

이력 리스트의 첫번째 줄로 이동합니다.

**end-of-history (M->)**

이력 리스트의 마지막 줄로 이동합니다. i.e., 현재 입력중인 줄.

**reverse-search-history (C-r)**

필요에 따라 현재 줄부터 시작해 이력 리스트를 역순으로 검색합니다. 이 검색은 증분 검색입니다. 명령어는 일치한 텍스트에 영역을 설정하고 마크를 활성화합니다.

**forward-search-history (C-s)**

필요에 따라 현재 줄부터 시작해 이력 리스트를 순서대로 검색합니다. 이 검색은 증분 검색입니다. 명령어는 일치한 텍스트에 영역을 설정하고 마크를 활성화합니다.

**non-incremental-reverse-search-history (M-p)**

필요에 따라 현재 줄부터 시작해 유저가 넘긴 문자열을 사용해 이력 리스트로부터 역순으로 비-증분 검색을 실행합니다. 검색 문자열은 이력 줄의 어느 부분에도 일치할 수 있습니다.

**non-incremental-forward-search-history (M-n)**

필요에 따라 현재 줄부터 시작해 유저가 넘긴 문자열을 사용해 이력 리스트로부터 순서대로 비-증분 검색을 실행합니다. 검색 문자열은 이력 줄의 어느 부분에도 일치할 수 있습니다.

**history-search-forward ()**

현재 줄의 시작 위치와 커서 사이에 있는 문자열을 사용해 이력을 순서대로 검색합니다. 검색 문자열은 이력 줄의 첫머리부터 일치해야 합니다. 이는 비-증분 검색입니다. 기본 설정에서 이 명령어는 바운딩되어 있지 않습니다.

**history-search-backward ()**

현재 줄의 시작 위치와 커서 사이에 있는 문자열을 사용해 이력을 역순으로 검색합니다. 검색 문자열은 이력 줄의 첫머리부터 일치해야 합니다. 이는 비-증분 검색입니다. 기본 설정에서 이 명령어는 바운딩되어 있지 않습니다.

**history-substring-search-forward ()**

현재 줄의 시작 위치와 커서 사이에 있는 문자열을 사용해 이력을 순서대로 검색합니다. 검색 문자열은 이력 줄의 어느 부분에도 일치할 수 있습니다. 이는 비-증분 검색입니다. 기본 설정에서 이 명령어는 바운딩되어 있지 않습니다.

**history-substring-search-backward ()**

현재 줄의 시작 위치와 커서 사이에 있는 문자열을 사용해 이력을 역순으로 검색합니다. 검색 문자열은 이력 줄의 어느 부분에도 일치할 수 있습니다. 이는 비-증분 검색입니다. 기본 설정에서 이 명령어는 바운딩되어 있지 않습니다.

**yank-nth-arg (M-C-y)**

이전 명령어의 첫번째 인수(보통 이전 줄의 두 번째 단어)를 포인트에 삽입합니다. 인수 *n*을 넘기면 이전 명령어의 *n*번째 단어(이전 명령어의 단어는 0번부터 시작합니다)를 삽입합니다. 음수 인수는 이전 명령어의 뒤에서부터 *n*번째 단어를 삽입합니다. 인수 *n*이 계산된 후, '!*n*' 이력 전개가 지정된 것처럼 인수를 추출합니다.

**yank-last-arg (M-. or M-_)**

이전 명령어의 마지막 인수(이전 이력의 마지막 단어)를 삽입합니다. 숫자 인수를 넘기면 `yank-nth-arg`처럼 동작합니다. `yank-last-arg`를 연속해서 호출하면 이력 리스트를 거슬러 올라가며 각 줄의 마지막 단어(또는 첫번째 호출의 인수로 식별된 단어)를 호출될 때마다 삽입합니다. 이 연속 호출에서 숫자 인수를 넘기면 이력 리스트에서의 순회할 방향을 지정합니다. 음수는 순회 방향을 반대로 변경합니다(역순 또는 정순). 이력 전개 기능은 '!$' 이력 전개가 지정된 것처럼 마지막 인수를 추출하기 위해 사용됩니다.

**operate-and-get-next (C-o)**

현재 줄을 개행이 입력된 것처럼 받아서 호출한 원래 애플리케이션으로 되돌리고, 이력으로부터 현재 줄의 다음 줄을 편집하기 위해 꺼내옵니다. 숫자 인수를 넘기면 현재 줄 대신 사용할 이력 리스트의 줄을 지정합니다.
