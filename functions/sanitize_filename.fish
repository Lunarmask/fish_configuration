# Replace whitespace and special characters

function sanitize_filename -a original_filename -d "Renames file without unwanted characters and formatting"

  if test -z $original_filename
    echo Argument is empty.
    return 1
  end

  if ! test -e $original_filename
    echo cannot find file: $original_filename
    return 1
  end

  set -l modified_filename (
    echo $original_filename |
    tr ' ' '_' | # remove whitespace
    tr '[:upper:]' '[:lower:]' | # forces lowercase
    sed 's/\._/_/g' | # removes ugly periods
    sed 's|-[[:digit:]]*\.|\.|g' # removes youtube-dl identifier
    )
  echo "'$original_filename' => '$modified_filename'"
  mv $original_filename $modified_filename
end
