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