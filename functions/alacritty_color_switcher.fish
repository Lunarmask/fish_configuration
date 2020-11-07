# Quickly switch between installed Alacritty Themes.

function alacritty_color_switcher
  if test (count $argv) -gt 1
    echo "Entered too many arguments"
    echo $argv
    return 1
  end

  if test -z $argv
    echo "Active Colorscheme: $COLORSCHEME" \n
    echo 'List the available colorschemes with the argument of "list".'
    return 1
  end

  if test $argv = "list"
    echo "Active Colorscheme: $COLORSCHEME" \n
    ls ~/.config/alacritty/colorschemes/
    return 0
  end

  set colorscheme (ls ~/.config/alacritty/colorschemes/ | grep $argv)

  if test (count $colorscheme) -lt 1
    echo "No match found: $argv"
    return 1
  else if test (count $colorscheme) -gt 1
    echo "Too many results returned; Narrow your selection"
    echo $colorscheme
    return 1
  end

  if test (uname) = "Linux"
    cp ~/.config/alacritty/alacritty_linux_master.yml ~/.config/alacritty/alacritty.yml
  else if test (uname) = "Darwin"
    cp ~/.config/alacritty/alacritty_macos_master.yml ~/.config/alacritty/alacritty.yml
  else
    echo "Did not match OS to an alacritty_master.yml"
    echo (uname)
    return 1
  end

  cat ~/.config/alacritty/colorschemes/$colorscheme >> ~/.config/alacritty/alacritty.yml
  echo "Theme has been switched to: $colorscheme"

  set -x COLORSCHEME (string replace ".yaml" "" $colorscheme)
  echo $COLORSCHEME > ~/.config/alacritty/active_colorscheme

  alacritty_font_switcher (cat ~/.config/alacritty/current_font | string split ' ' | head -1)
  return 0
end
