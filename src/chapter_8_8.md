## 8.8 A Programmable Completion Example
`complete`와 `compgen`이 제공하는 기본 액션 이상의 추가 완성 기능을 얻는 가장 흔한 방법은 셸 함수를 사용하고 `complete -F`로 특정 명령어에 바인딩하는 것입니다.

다음 함수는 `cd` 빌트인의 완성을 제공합니다. 셸 함수를 완성에서 사용할 때 무엇을 해야하는지에 대한 꽤 좋은 예제입니다. 이 함수는 `$2`로 넘겨진 단어를 사용해 완성할 디렉터리 이름을 결정합니다. `COMP_WORDS` 배열 변수도 사용할 수 있습니다. 현재 단어는 COMP_CWORD 변수에 색인되어 있습니다.

이 함수는 많은 부분을 `complete`와 `compgen` 빌트인에 의존하고 있으며, Bash의 `cd`가 기본적인 디렉터리 이름을 받는 것 이상인 다음 기능을 추가합니다. 물결줄표 확장([Tilde Expansion](chapter_3_5_2.html)을 참조), 이전에 설명([Bourne Shell Builtins](chapter_4_1.html)를 참조)한 *$CDPATH*의 디렉터리를 검색하기, `cdable_vars` 셸 옵션([The Shopt Builtin](chapter_4_3_2.html)을 참조)에 대한 기본적인 지원. 그리고 `_comp_cd`는 스페이스나 탭을 포함하는 파일명에 대응하기 위해 *IFS*의 값이 개행만 포함하도록 수정하며, `compgen`은 생성한 완성 후보를 한 줄에 하나씩 출력합니다.

완성 후보는 *COMPREPLY* 배열 변수에 저장되며, 각 인덱스에 하나의 완성 후보가 저장됩니다. 프로그래밍 가능한 완성 시스템은 함수가 반환될 때 이 곳에서 완성 후보를 꺼내옵니다.

```sh
# bash_completion 패키지의 cd 완성 함수에 기초한
# cd 빌트인을 위한 완성 함수
_comp_cd()
{
    local IFS=$' \t\n'    # IFS 정규
    local cur _skipdot _cdpath
    local i j k

    # 물결줄표를 전체 경로명으로 전개하는 물결줄표 전개
    case "$2" in
    \~*)    eval cur="$2" ;;
    *)      cur=$2 ;;
    esac

    # cdpath 또는 절대 경로가 없음 -- 바로 디렉터리 완성을 실행
    if [[ -z "${CDPATH:-}" ]] || [[ "$cur" == @(./*|../*|/*) ]]; then
        # compgen은 한 줄에 한 경로를 출력. while 루프를 사용할 수도 있음
        IFS=$'\n'
        COMPREPLY=( $(compgen -d -- "$cur") )
        IFS=$' \t\n'
    # CDPATH와 CDPATH에 없는 경우 현재 디렉토리의 디렉터리
    else
        IFS=$'\n'
        _skipdot=false
        # CDPATH의 널 디렉터리 이름을 .으로 변환하기 위한 전처리
        _cdpath=${CDPATH/#:/.:}
        _cdpath=${_cdpath//::/:.:}
        _cdpath=${_cdpath/%:/:.}
        for i in ${_cdpath//:/$'\n'}; do
            if [[ $i -ef . ]]; then _skipdot=true; fi
            k="${#COMPREPLY[@]}"
            for j in $( compgen -d -- "$i/$cur" ); do
                COMPREPLY[k++]=${j#$i/}        # 디렉터리를 잘라냄
            done
        done
        $_skipdot || COMPREPLY+=( $(compgen -d -- "$cur") )
        IFS=$' \t\n'
    fi

    # 적절한 셸 옵션이 설정되어 있고 완성 후보가 없다면 변수 이름
    if shopt -q cdable_vars && [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        COMPREPLY=( $(compgen -v -- "$cur") )
    fi

    return 0
}
```

이 완성 함수를 `complete`의 `-F` 옵션으로 넘겨서 설치할 수 있습니다.

```sh
# Readline에게 적절하게 따옴표로 감싸고 디렉터리 뒤에 슬래시를 붙이도록 지시합니다.
# 다른 인수에 대해서는 bash의 기본 완성을 사용합니다.
complete -o filenames -o nospace -o bashdefault -F _comp_cd cd
```

나머지 자세한 부분에 대해서는 Bash와 Readline이 처리하도록 두고싶기 때문에 다른 옵션들을 사용해서 Bash와 Readline에게 필요한 것을 전달했습니다. `-o filenames` 옵션은 Readline에게 완성 후보는 파일명으로 다루어져야 하며 적절히 따옴표로 감싸야한다고 지시합니다. 이 옵션은 Readline이 파일명이 디렉터리 이름이라고 판단했을 경우 뒤에 슬래시를 추가하도록 합니다(*CDPATH*로 발견한 디렉터리를 사용할 경우 `_comp_cd`를 확장해서 슬래시를 추가하길 원하는 이유가 될 수도 있습니다. Readline은 이 완성을 디렉터리로 판단할 수 없기 때문입니다). `-o nospace` 옵션은 유저가 스페이스 문자를 직접 추가하고 싶을 때를 대비해 Readline에게 디렉터리 명에 스페이스 문자를 추가하지 않도록 지시합니다. `-o bashdefault` 옵션은 "Bash 기본" 완성의 나머지 부분, 그러니까 Bash가 기본 Readline 집합에 추가하는 완성 후보를 가져옵니다. 여기에는 명령어 이름 완성, '$' 또는 '${'로 시작하는 단어의 변수 완성, 경로명 전개 패턴을 포함하는 완성([Filename Expansion](chapter_3_5_8.html)을 참조) 등을 포함합니다.

일단 `complete`로 설치하면 `_comp_cd`는 `cd` 명령어에서 단어 완성을 시도할 때마다 호출됩니다.

더 많은 예제(GNU, Unix, Linux의 일반적인 명령어 거의 전부를 완성하는 풍부한 컬렉션)은 bash_completion 프로젝트의 일부로 사용 가능합니다. 이들은 많은 GNU/Linux 배포판에서 기본으로 설치됩니다. 본래는 Ian Macdonald가 작성했습니다만 프로젝트는 이제 https://github.com/scop/bash-completion/ 에서 관리됩니다. 여기에는 Solaris와 Mac OS X와 같은 다른 시스템에 이식한 버전도 있습니다.

bash_completion 패키지의 구버전은 Bash와 함께 `examples/complete` 서브 디렉터리에 배포됩니다.
