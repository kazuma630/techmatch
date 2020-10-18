function chat() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200){
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.message;
      const list = document.getElementById("list")
      const formText = document.getElementById("content-message")
      const HTML = `
      <div class="chat-box">
      <div class="chat-face">
      <% if ${item.user.avatar.attached?} %>
        <%= image_tag ${item.user.avatar}, class:"user-image" %>
      <% end %>
      </div>
      <div class="chat-message"><strong><%= ${item.content} %></strong><br>
        <%= l ${item.created_at} %>
      </div>
    </div>`;
    list.insertAdjacentHTML("afterend", HTML)
    formText.value = "";
    };
    e.preventDefault();
  });
}

window.addEventListener("load", chat);