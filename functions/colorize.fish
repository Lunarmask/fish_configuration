# Outputs the colors of the current colorscheme in the terminal

function colorize
  set color_options "black\nred\ngreen\nyellow\nblue\nmagenta\ncyan\nwhite"
  set phrase "Sphinx of black quarts, judge my vow!"

  set_color normal; echo --------- Bright ---------
  print_bright_colors $color_options $phrase
  set_color normal; echo --------- Normal ---------
  print_color_options $color_options $phrase
  set_color normal; echo ---------  Dim  ---------
  print_dim_colors $color_options $phrase
end

function print_bright_colors
  for color in (echo -e $argv[1])
    set_color -o $color; echo "bright $color; "$argv[2]
  end
end

function print_color_options
  for color in (echo -e $argv[1])
    set_color $color; echo "normal $color; "$argv[2]
  end
end

function print_dim_colors
  for color in (echo -e $argv[1])
    set_color -d $color; echo "dim $color; "$argv[2]
  end
end

