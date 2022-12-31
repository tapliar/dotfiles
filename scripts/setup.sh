#!/bin/bash

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] %s %s\e[0m\n" "$1" "$2"
}

print_info() {
    # Print output in purple
    printf "\n\e[0;35m %s\e[0m\n\n" "$1"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] %s\e[0m" "$1"
}

print_result() {
    [ "$1" -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

    [ "$3" == "true" ] && [ "$1" -ne 0 ] \
    && exit
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] %s\e[0m\n" "$1"
}
