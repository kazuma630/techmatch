$(document).on('turbolinks:load', function(){

  $(function() {
    $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'normal');
  });
  function buildHTML(message) {
    var content = message.content ? `${ message.content }` : "";
    if (message.image != null) {
      var img = `<img src= ${ message.image } class="icon-image-mini">` 
    } else {
      var img = `<img src="http://localhost3000/no_image.png" class="icon-image-mini" alt=" ">` 
    }
    
    var html = ` <div class="kaiwa">
            <a href="/users/${message.user_id}">
              <figure class="kaiwa-img-left">
              ${img}
              </figure>
             </a>
             <div class="kaiwa-text-right">
               <p class="kaiwa-text"> 
                 <strong>${content}</strong><br>
                 ${message.date} 
               </p>
             </div>
           </div>`
  return html;
  }
  const form = document.getElementById("form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    e.stopPropagation();
    var message = new FormData(document.getElementById("form"));
    var url = "../messages"; 
    $.ajax({  
      url: url,
      type: 'POST',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chats').append(html);
      $('#content-message').val(''); 
      scrollBottom();
    })
    .fail(function(data){
      alert('エラーが発生したためメッセージは送信できませんでした。');
    })
    .always(function(data){
      $('.form-submit').prop('disabled', false);
    })
    function scrollBottom(){
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'fast');
    }
  })
});