const editTitleField = () => {
  const buttonEdit = document.querySelector(".display-header-button");
  const formEdit = document.querySelector(".wrapper-title-survey");
  const staticTitle = document.querySelector(".title_and_description")

  if (buttonEdit && formEdit && staticTitle) {
    buttonEdit.addEventListener('click', (event) => {
      staticTitle.classList.toggle("invisible");
      formEdit.style.display = "inherit";
    });
  }
}

export { editTitleField }
