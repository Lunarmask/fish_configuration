# Custom Fish Prompt from Lunarmask_

function fish_prompt
  set prompt_status $status
  test -n "$SSH_CONNECTION"; and echo -n "["(hostname)"] "
  set_color $fish_color_cwd && echo -n (prompt_pwd)" "

  if git rev-parse --is-inside-work-tree &>/dev/null
    set is_git_dirty (
      # The first checks for staged changes, the second for unstaged ones.
      # We put them in this order because checking staged changes is *fast*.
      not command git diff-index --ignore-submodules --cached --quiet HEAD -- >/dev/null 2>&1
      or not command git diff --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1
      and echo "1"
    )

    set git_branch (git branch | grep '*' | string sub --start=3)

    if test -n "$is_git_dirty"
      set_color red && echo -n "($git_branch*)"
    else
      set_color normal && echo -n "($git_branch)"
    end
  end

  if test $prompt_status -eq 0
    set_color green && echo "-> "
  else
    set_color red && echo "!> "
  end
end
