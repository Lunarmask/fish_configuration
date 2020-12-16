# Opens an excrypted image archive and views it's contents in an temp_dir.
# Assumes you are storing archive password in keepassxc

function encrypted_image_viewer
  if test (count $argv) -gt 1
    echo "Entered too many arguments"
    echo $argv
    return 1
  end

  if test -z $argv
    echo "Please enter the name of a 7z image file to view."
    return 1
  end

  if test ! -f $argv
    echo "File not found! File is unreadable or doesn't exist."
    return 1
  end

  if test ! (string match -r ".7z|.zip" $argv)
    echo "File is not a compatible type. file != .7z|.zip"
    return 1
  end

  set filename $argv

  set temp_dir ~/Pictures/\.image_temp

  echo Filename: $filename
  echo setting up temp_dir: $temp_dir

  begin
    sudo mount -t tmpfs -o size=500m tmpfs $temp_dir
    and 7z x -aoa -p$archive_password $filename -o$temp_dir > /dev/null
    and feh $temp_dir
    and sudo umount $temp_dir
  end

end
