function colorize_old
  set option (set_color -c)
  for color in $option
    begin
      set_color $color; and echo normal $color
    end
    begin
      set_color -d $color; and echo dim $color
    end
    begin
      set_color -o $color; and echo bold $color
    end
  end
end
