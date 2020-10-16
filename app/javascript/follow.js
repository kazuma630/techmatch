window.addEventListener('load', function(){
  const btnLink = document.querySelector('.btn-click');
  btnLink.addEventListener('click', function(){
    btnLink.remove()
  });
});