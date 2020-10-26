$(document).on('turbolinks:load', function(){
  $(function() {
    $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'normal');
  });
  function buildHTML(message) {
    var content = message.content ? `${ message.content }` : "";
    var img = message.image ? `<img src= ${ message.image } class="icon-image-mini">` : "";
   
    var html = ` <div class="kaiwa">
             <figure class="kaiwa-img-left">
             ${img}
             </figure>
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
      $('#content-message').val(''); //input内のメッセージを消しています。
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
      // var target = $('.kaiwa').last();
      // var position = target.offset().top;
      // $('.messages').animate({
      //   scrollTop: position
      // }, 300, 'swing');
    }
  })
});




// $(document).on('turbolinks:load', function(){
//   $('#form').on('submit', function(e){
//     e.preventDefault();
//     var message = new FormData(this); //フォームに入力した値を取得しています。
//     console.log(message)
//   })
// });

// window.addEventListener("load", chat);

// function chat() {
//   const submit = document.getElementById("submit");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault
//     const formData = new FormData(document.getElementById("form"));
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", "/messages", true);
//     XHR.responseType = "json";
//     XHR.send(formData);
//     XHR.onload = () => {
//       if (XHR.status != 200){
//         alert(`Error ${XHR.status}: ${XHR.statusText}`);
//         return null;
//       }
//       const item = XHR.response.message;
//       console.log(item)
//       const list = document.getElementById("list")
//       const formText = document.getElementById("content-message")
//       const HTML = `
//       <div class="kaiwa">
//         <figure class="kaiwa-img-left">
//           <img src="${item.avatar}" class="icon-image-mini">
//         </figure>
//         <div class="kaiwa-text-right">
//           <p class="kaiwa-text"> 
//             <strong>${item.content}</strong><br>
 
//           </p>
//         </div>
//       </div>
//  `;
//     list.insertAdjacentHTML("afterend", HTML);
//     formText.value = "";
//     };
//   });
// }
// window.addEventListener("load", chat);




// ${item.created_at.strftime("%Y/%m/%d %H:%M")} 