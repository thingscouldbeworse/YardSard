$set_pic_src = function(src, img) {
  // TODO: set_pic_src needs validation before putting in an image?
  console.log("setting new image!");
  $(img).attr('src', $(src).val() );
}
