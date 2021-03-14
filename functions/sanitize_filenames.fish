# Replace whitespace and special characters

function sanitize_filenames -d "Renames files without unwanted characters and formatting"
  if test (count $argv) -gt 2
    echo "Entered too many arguments"
    echo $argv
    return 1
  end

  if test (count $argv) -eq 0
    echo 'No arguments given.'
    return 1
  end

  if string match -r '^h$|^help$' "$argv[1]"
    echo "Please give one or two arguments"
    echo "example 1: $`sanitize_filename png` renames *.png"
    echo "example 2: $`sanitize_filename madmax m4a` renames madmax*.m4a"
    return 0
  end

  if test (count $argv) -eq 2
    for filename in (ls $argv[1]*\.$argv[2])
      sanitize_filename $filename
    end
    return 0
  end

  if test (count $argv) -eq 1
    for filename in (ls *\.$argv)
      sanitize_filename $filename
    end
    return 0
  end
end
