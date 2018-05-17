# theme for fish shell : graystatus

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'informative'
set __fish_git_prompt_describe_style 'default'

function prompt_rbenv
    if not type -q 'rbenv'
        return
    end

    set -l rbenv_version (rbenv version-name)

    if type -q 'rbenv-gemset'
        set -l rbenv_gemset (rbenv gemset active ^/dev/null | sed 's| global||')
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
    printf "\033[K"
    set_color brblack
    echo -n '['(prompt_pwd)']'
    echo -n (__fish_git_prompt)
    echo
    echo -n '$ '
    set_color normal
end

function fish_right_prompt
    set_color brblack
    echo -n (prompt_rbenv)
    set_color normal
end
