# resize all .jpg && .png images to stardard

function resize_images
  ls *.png; and begin
    mogrify -resize 1450X1450\> -format jpg *.png
    rm *.png
  end

  mogrify -resize 1450X1450\> *.jpg
end

