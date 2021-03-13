# Extracts all filetypes

function extract
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

  ark -a --batch $argv
end

