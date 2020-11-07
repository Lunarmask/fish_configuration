# Custom Fish Prompt from Lunarmask_

function fish_prompt
  set prompt_status $status
  set dir_array (pwd | string replace /home/false '~' | string split /)
  set dir_array_length (count $dir_array)
  if test $dir_array_length -eq 1
    set prompt $dir_array[1]
  else
    for i in (seq (math $dir_array_length -1))
      if test (string sub --length 1 $dir_array[$i]) = '.'
        set prompt $prompt (string sub --length 2 $dir_array[$i])
      else
        set prompt $prompt (string sub --length 1 $dir_array[$i])
      end
    end
    set prompt (string join / $prompt)
    set prompt $prompt/$dir_array[$dir_array_length]
  end
  if git rev-parse --is-inside-work-tree &>/dev/null
    set git_branch (string sub --start=3 (git branch))
    set git_branch \($git_branch\)
  end
  set_color $fish_color_cwd && echo -n $prompt
  set_color normal && echo -n " $git_branch"
  if test $prompt_status -eq 0
    set_color green && echo "-> "
  else
    set_color red && echo "!> "
  end
end
