# Outputs the colors of the current colorscheme in the terminal

function colorize
  set color_options "black\nred\ngreen\nyellow\nblue\nmagenta\ncyan\nwhite"
  set phrase "Sphinx of black quarts, judge my vow!"

  set_color normal; echo --------- Bright ---------
  _print_bright_colors $color_options $phrase
  set_color normal; echo --------- Normal ---------
  _print_color_options $color_options $phrase
  set_color normal; echo ---------  Dim  ---------
  _print_dim_colors $color_options $phrase
end

function _print_bright_colors
  for color in (echo -e $argv[1])
    set_color -o $color; printf "bright $color; "$argv[2]"\t"
    set_color -o br$color; printf "bright br$color; "$argv[2]"\n"
  end
end

function _print_color_options
  for color in (echo -e $argv[1])
    set_color $color; printf "normal $color; "$argv[2]"\t"
    set_color br$color; printf "normal br$color; "$argv[2]"\n"
  end
end

function _print_dim_colors
  for color in (echo -e $argv[1])
    set_color -d $color; printf "dim    $color; "$argv[2]"\t"
    set_color -d br$color; printf "dim   br$color; "$argv[2]"\n"
  end
end

