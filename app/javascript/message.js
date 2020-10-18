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
 `;
    list.insertAdjacentHTML("afterend", HTML)
    formText.value = "";
    };
    e.preventDefault();
  });
}

window.addEventListener("load", chat);