function _is_symfony() {
    if [ -e "`pwd`/bin/console" ] || [ -e "`pwd`/app/console" ]
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
    local YELLOW="%{$fg[yellow]%}"

    local SYMFONY=""

    echo -n "";

    if [[ ${SYMFONY_ENV} != dev* ]]; then
        SYMFONY+="${SEPARATOR}${YELLOW}${SYMFONY_ENV}"
    fi
    if [[ ${SYMFONY_ENV} == prod* ]]; then
        SYMFONY+="${SEPARATOR}${RED}${SYMFONY_ENV}"
    fi

    if [ ${SYMFONY_DEBUG} -eq 0 ]; then
        SYMFONY+="${SEPARATOR}${YELLOW}no-debug"
    fi

    if [ ${SYMFONY_CACHE} -eq 1 ]; then
        SYMFONY+="${SEPARATOR}${YELLOW}cache"
    fi

    if [[ -n ${SYMFONY} ]]; then
        echo -n " $FG[237]sf${SYMFONY}"
    fi
}
