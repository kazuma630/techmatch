function open() {
  const pullDownButton = document.getElementById("my-page");
  const pullDownParent = document.getElementById("pull-down");
    if (pullDownButton.getAttribute("data-load") != null) {
      return null;
    }
    pullDownButton.setAttribute("data-load", "true");
  pullDownButton.addEventListener('click', function(){
    if (pullDownParent.getAttribute("style") == "display:block;") {
      pullDownParent.removeAttribute("style","display:block;")
    } else {
      pullDownParent.setAttribute("style","display:block;")
    }
  });
}

setInterval(open, 1000);

$(window).scroll(function () {
  const now = $(window).scrollTop();
  if (now > 300) {
    $('.pagetop').fadeIn("slow");
  } else {
    $('.pagetop').fadeOut('slow');
  }
});