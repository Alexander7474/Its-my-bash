#!/bin/bash

visible_length() {
    local str="$1"
    str=$(printf '%b' "$str")
    str=$(printf '%s' "$str" | sed $'s/\033\\[[0-9;]*[[:alpha:]]//g')
    printf '%s' "${#str}"
}

# creating PS1 with ps_left and ps_right

get_left_ps() {
    local cpt=0
    local left_ps=""
    local left
    local value
    local color
    local command

    while (( cpt <= 5 )); do
        left="LEFT_$cpt"
        value="${!left}"

        [[ -z "$value" ]] && break

        color="${value%% *}"
        command="${value#* }"

        left_ps+="${color} $(eval "$command") "
        left_ps+="$r$LEFT_SEPARATOR"

        ((cpt++))
    done

    printf '%s\n' "$left_ps"
}

get_right_ps() {
    local cpt=0
    local right_ps=""
    local right
    local value
    local color
    local command

    while (( cpt <= 5 )); do
        right="RIGHT_$cpt"
        value="${!right}"

        [[ -z "$value" ]] && break

        color="${value%% *}"
        command="${value#* }"

        right_ps+="${color} $(eval "$command") "
        right_ps+="$r$RIGHT_SEPARATOR"

        ((cpt++))
    done

    printf '%s\n' "$right_ps"
}
