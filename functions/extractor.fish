# Extracts all filetypes

function extractor
  if test (count $argv) -gt 1
    echo "Entered too many arguments"
    echo $argv
    return 1
  end

  if test -z $argv
    echo "Entered no arguments"
    return 1
  end

  if test -e $argv
    echo -e "\nExtracting $argv\n"
  else
    echo "The file doesn't exist or isn't reachable"
    return 1
  end

  set arg_parts (basename $argv | string split '.' )

  if test (count $arg_parts) -gt 2 && test $arg_parts[-2] = "tar"
    set output_dir (string join '.' $arg_parts[1..-3])
    mkdir $output_dir

    switch $arg_parts[-1]
      case bz2
        tar xjf $argv
      case gz
        tar xzf $argv
      case xz
        tar xf $argv
      case zst
        unzstd $argv
      case *
        echo "'$argv' cannot be extracted via extractor"
    end
  else
    set output_dir (string join '.' $arg_parts[1..-2])
    mkdir $output_dir

    switch $arg_parts[-1]
      case 7z
        7z x -o$output_dir $argv
      case zip
        7z x -o$output_dir $argv
      case rar
        7z x -o$output_dir $argv
      case tbz2
        tar xjf $argv
      case bz2
        bunzip2 $argv
      case gz
        gunzip $argv
      case tar
        tar xf $argv
      case tgz
        tar xzf $argv
      case Z
        uncompress $argv;
      case deb
        ar x $argv
      case *
        echo "'$argv' cannot be extracted via extractor"
    end
  end
end

