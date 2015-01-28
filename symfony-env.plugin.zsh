function _is_symfony() {
    local CONSOLE="`pwd`/app/console"

    if [ -e $CONSOLE ]
    then
        return 1
    fi

    return 0
}

function symfony_env_prompt() {
    $(_is_symfony)
    if [ $? -eq 0 ]; then return; fi

    local SEPARATOR="$FG[237]:"
    local RED="%{$fg[red]%}"
    local GREEN="%{$fg[green]%}"
    local YELLOW="%{$fg[yellow]%}"

    echo -n " $FG[237]sf$SEPARATOR";

    if [[ $SYMFONY_ENV != dev* ]];
        then echo -n "$YELLOW";
    fi
    if [[ $SYMFONY_ENV == prod* ]];
        then echo -n "$RED";
    fi

    echo -n "$SYMFONY_ENV"

    if [ $SYMFONY_DEBUG -eq 1 ];
        then echo -n "${SEPARATOR}${GREEN}debug";
        else echo -n "${SEPARATOR}${YELLOW}no-debug";
    fi

    if [ $SYMFONY_CACHE -eq 1 ];
        then echo -n "${SEPARATOR}${YELLOW}cache";
    fi
}
