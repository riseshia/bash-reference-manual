### 3.2.7 GNU Parallel

명령을 병렬로 실행할 수도 있습니다. 이 기능은 bash에 내장되어 있지 않습니다. GNU Parallel이 바로 이를 위한 도구입니다.

GNU Parallel은 이름으로부터 알 수 있듯, 명령어를 병렬로 빌드하거나 실행할 수 있습니다. 같은 명령을 다른 인수와 함께 실행할 수 있습니다. 예를 들어 파일명이나 사용자명, 호스트명, 파일로부터 입력을 받을 수 있죠. GNU Parallel은 흔한 작업(줄 단위의 입력, 입력 줄의 특정 위치, 다른 방식의 입력 소스 지정 등등)을 위한 간결한 표기법을 제공합니다. parallel은 `xargs`나 자신의 입력 소스들로부터 명령어를 얻고, 여러 Bash 인스턴스에 제공할 수 있습니다.

완전한 설명은 GNU Parallel 문서를 확인하세요. 여기에서는 몇몇 예제를 간단한 설명과 함께 제공합니다.

예를 들어, 단순히 `xargs` 대신 사용해 현재 디렉토리와 서브디렉토리의 모든 html 파일을 압축할 수 있습니다.

```sh
find . -type f -name '*.html' -print | parallel gzip
```

파일명안의 개행같은 특별한 문자들을 유지하고 싶다면, find의 -print0 옵션과 parallel의 -0 옵션을 사용하세요.
현재 디렉토리의 파일들이 하나의 `mv` 호출로 옮기기에 너무 많은 경우, parallel을 사용할  수 있습니다.

```sh
printf '%s\\n' * | parallel mv {} destdir
```

이처럼 {}는 표준 입력의 각 행으로 대체됩니다. 대부분의 경우에는 `ls`로 충분합니다만, 모든 파일명을 다루고 싶을 때에는 충분하지 않습니다. `printf`는 셸 빌트인이므로, 커널의 프로그램 인수 갯수 제한을 받지 않습니다. 그러므로 '\*'를 사용할 수 있습니다(그렇지만 `dotglob` 셸 옵션에 대해서 확인하세요). 만약 파일명에 포함된 특별한 문자를 처리할 필요가 있다면 

```sh
printf '%s\0' * | parallel -0 mv {} destdir
```

처럼 사용할 수 있습니다.

다음은 `mv` 명령을 현재 폴더에 있는 파일 숫자만큼 실행합니다. -X 옵션을 추가하는 것으로 병렬 `xargs`를 흉내낼 수 있습니다.

```sh
printf '%s\0' * | parallel -0 -X mv {} destdir
```

(`dotglob` 옵션이 켜져있다면 패턴을 변경해야 합니다.)

GNU Parallel은 파일로부터 줄단위로 입력받는 전형적인 코드를 대체할 수 있습니다. 다음 예시는 각 행에 파일명이 들어있습니다.

```sh
while IFS= read -r x; do
                    do-something1 "$x" "config-$x"
                    do-something2 < "$x"
                  done < file | process-output
```

이를 람다를 떠올리는 좀 더 간결한 문법으로 쓸 수 있습니다.

```sh
cat list | parallel "do-something1 {} config-{} ; do-something2 < {}" |
           process-output
```

Parallel은 파일명에서 확장자를 제거하는 기능을 내장하고 있어 일괄 파일 변환이나 재명명시에 이용할 수 있습니다.

```sh
ls *.gz | parallel -j+0 "zcat {} | bzip2 >{.}.bz2 && rm {}"
```

이 코드는 현재 디렉토리의 파일명이 .gz 로 끝나는 모든 파일을 bzip2를 이용하여 재압축합니다. 이는 CPU 갯수만큼(-j+0) 병렬로 동작합니다. (여기에서는 간략히 보여주기 위해 `ls`를 사용했습니다. 예상치 못한 문자가 포함된 파일명을 올바르게 처리하기 위해서는 `find`를 이용하세요.) Parallel은 명령줄으로부터 인수들을 받을 수 있으므로 다음처럼도 쓸 수 있습니다.

```sh
parallel "zcat {} | bzip2 >{.}.bz2 && rm {}" ::: \*.gz
```

명령어가 출력을 생성하는 경우, 입력순에 맞춰 정렬되어있기를 바랄 수도 있습니다. 예를 들어, 다음 명령은 호출이 종료되는 순서대로 결과를 출력합니다.

```sh
{
    echo foss.org.my ;
    echo debian.org ;
    echo freenetproject.org ;
} | parallel traceroute
```

-k 옵션을 추가하여 `traceroute foss.org.my`의 결과가 가장 먼저 출력되도록 보장할 수 있습니다.

```sh
{
    echo foss.org.my ;
    echo debian.org ;
    echo freenetproject.org ;
} | parallel -k traceroute
```

마지막으로 Parallel은 셸 명령어들의 나열을 `cat file | bash` 처럼 병렬로 처리하기 위해서도 사용할 수도 있습니다. 파일명 목록을 파일로부터 넘겨받고, 이것들을 다루는 셸 명령어들을 생성하여 셸에게 넘겨주는 방식은 흔하지 않습니다만, Parallel을 이용하면 이 작업을 고속화할 수 있습니다. 파일에 셸 명령어들이 한 줄에 하나씩 들어있다고 가정합시다.

```sh
parallel -j 10 < file
```

이 코드는 (인수로 명령을 넘기지 않았으므로) 10개의 셸을 사용해 명령어를 실행합니다. 
