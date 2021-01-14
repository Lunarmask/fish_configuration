# resize all .jpg && .png images to stardard

function resize_images -a filename_head

  if test -z $filename_head
    echo no argument
    mogrify -resize 1500X1500\> *.jpg

    ls *.png; and begin
      mogrify -resize 1500X1500\> -format jpg *.png
      rm *.png
    end
  else
    echo $filename_head
    mogrify -resize 1500X1500\> $filename_head*.jpg

    ls $filename_head*.png; and begin
      mogrify -resize 1500X1500\> -format jpg $filename_head*.png
      rm $filename_head*.png
    end

  end

end

