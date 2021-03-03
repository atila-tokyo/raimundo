
const resultList = document.querySelector('#results');
const search = document.querySelector('#search');


const removeAllChildNodes = (parent) => {
  while (parent.firstChild) {
    parent.removeChild(parent.firstChild);
  }
};

const chooseLi = (event) => {
  search.value = event.target.innerText;
  removeAllChildNodes(resultList);
};

const searchLeWagonDic = (event) => {
  event.preventDefault();
  const searchKeyword = search.value;
  const url = `https://wagon-dictionary.herokuapp.com/autocomplete/${searchKeyword}`;


  fetch(url)
    .then(response => response.json())
    .then((data) => {
      removeAllChildNodes(resultList);
      const words = data.words;

      words.forEach((word) => {
        const newTag = `<li>${word}</li>`;
        resultList.insertAdjacentHTML('beforeend', newTag);
      });
    });
};

search.addEventListener('keyup', searchLeWagonDic);
resultList.addEventListener('click', chooseLi);