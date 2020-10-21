if (location.pathname.match("posts/new")){
  window.addEventListener('load', (e) => {
    const inputElement = document.getElementById("posts_tag_name");
    inputElement.addEventListener('keyup', (e) => {
      const input = document.getElementById("posts_tag_name").value
      const xhr = new XMLHttpRequest();
      xhr.open("GET", `search/?input=${input}`, true);
      xhr.responseType = "json";
      xhr.send();
      xhr.onload = () => {
        const tagName = xhr.response.keyword;
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = ''
        tagName.forEach(function(tag){
          const parentsElement = document.createElement('div');
          const childeElement = document.createElement("div");

          parentsElement.setAttribute('id', 'parents')
          childeElement.setAttribute('id', tag.id)
          childeElement.setAttribute('class', 'child')

          parentsElement.appendChild(childeElement)
          childeElement.innerHTML = tag.name
          searchResult.appendChild(parentsElement)

          const clickElement = document.getElementById(tag.id);
          clickElement.addEventListener('click' () => {
            document.getElementById("posts_tag_name").value = clickElement.textContent
            clickElement.remove();
          })
        })
      }

    })
  })
}