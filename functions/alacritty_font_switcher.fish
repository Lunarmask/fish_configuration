# Quickly switch between installed Fonts in Alacritty

function alacritty_font_switcher
  if test (count $argv) -gt 1
    echo "Entered too many arguments"
    echo $argv
    return 1
  end

  if test -z $argv
    echo "Active Font: $FONTSET" \n
    echo 'List the available Fonts with the argument of "list".'
    return 1
  end

  if test $argv = 'ls'
    echo "Active Font-Set: $FONTSET" \n
    cat ~/.config/alacritty/fontsets
    return 0
  end

  if test $argv = 'test'
    cat cat ~/.config/alacritty/font_test.txt
    return 0
  end

  if test $argv = 'dl'
    echo "

    Inconsolata:
     - 'https://fonts.google.com/specimen/Inconsolata'

    Iosevka Term:
     - 'https://github.com/be5invis/Iosevka/releases'

    Fira Code:
     - 'https://github.com/tonsky/FiraCode'

    "
    return 0
  end

  if test $argv -lt 1 || test $argv -gt 11
    echo "Invalid Value Entered. Value needs to be between 1..11"
    return 1
  end

  set font_size "12.0"

  switch $argv
    case 1
      set new_font "monospace"
    case 2
      set new_font "Fira Code"
    case 3
      set new_font "Droid Sans Mono"
    case 4
      set new_font "Hack"
    case 5
      set new_font "IBM Plex Mono"
    case 6
      set new_font "Inconsolata"
      set font_size "14.0"
    case 7
      set new_font "Iosevka Term"
      set font_size "13.0"
    case 8
      set new_font "Iosevka Term Slab"
      set font_size "13.0"
    case 9
      set new_font "JetBrains Mono NL"
    case 10
      set new_font "Liberation Mono"
    case 11
      set new_font "Victor Mono"
  end

  set -x FONTSET $new_font
  echo $argv $new_font > ~/.config/alacritty/current_font
  sed -i "s/^\ \{4\}family:\ .\+/    family: $new_font/" ~/.config/alacritty/alacritty.yml
  sed -i "s/^\ \{2\}size:\ .\+/  size: $font_size/" ~/.config/alacritty/alacritty.yml

  echo "Font-set changed to $new_font"
  return 0
end
