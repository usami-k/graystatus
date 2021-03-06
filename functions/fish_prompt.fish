# theme for fish shell : graystatus

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'informative'
set __fish_git_prompt_describe_style 'default'

set --query GRAYSTATUS_COLOR_PROMPT; or set GRAYSTATUS_COLOR_PROMPT brblack
set --query GRAYSTATUS_COLOR_STATUS; or set GRAYSTATUS_COLOR_STATUS red

function prompt_rbenv
    if not type -q 'rbenv'
        return
    end

    set -l rbenv_version (rbenv version-name)

    if type -q 'rbenv-gemset'
        set -l rbenv_gemset (rbenv gemset active 2>/dev/null | sed 's| global||')
        if test -n "$rbenv_gemset"
            set rbenv_version $rbenv_version'/'$rbenv_gemset
        end
    end

    if test "$rbenv_version" = 'system'
        return
    end

    echo '<'$rbenv_version'>'
end

function fish_prompt
    set -l last_status $status
    printf "\033[K"
    if test $last_status -ne 0
        set_color $GRAYSTATUS_COLOR_STATUS
        echo "exit status $last_status"
    end
    set_color $GRAYSTATUS_COLOR_PROMPT
    echo -n '['(prompt_pwd)']'
    echo -n (__fish_git_prompt)
    echo
    echo -n (string repeat -n $SHLVL '$')
    echo -n ' '
    set_color normal
end

function fish_right_prompt
    set_color $GRAYSTATUS_COLOR_PROMPT
    echo -n (prompt_rbenv)
    set_color normal
end
