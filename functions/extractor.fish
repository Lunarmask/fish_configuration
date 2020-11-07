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

  switch $argv
    case *.7z
      7z x $argv
    case *.zip
      unzip $argv
    case *.tar.bz2
      tar xjf $argv
    case *.tbz2
      tar xjf $argv
    case *.tar.gz
      tar xzf $argv
    case *.bz2
      bunzip2 $argv
    case *.rar
      unrar x $argv
    case *.gz
      gunzip $argv
    case *.tar
      tar xf $argv
    case *.tgz
      tar xzf $argv
    case *.Z
      uncompress $1;;
    case *.deb
      ar x $argv
    case *.tar.xz
      tar xf $argv
    case *.tar.zst
      unzstd $argv
    case *
      echo "'$argv' cannot be extracted via extractor"
  end
end

