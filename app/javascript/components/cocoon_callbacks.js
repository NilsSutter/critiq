$('#questions').on('cocoon:after-insert', function(e, insertedItem) {
  if (insertedItem.length === 5) {
    console.log(insertedItem);
    let addedDropdown = insertedItem[2].lastElementChild.children["0"].children[1]
    let associatedChoiceBtn = insertedItem[4].lastElementChild
    let n = document.querySelectorAll('.select.optional.form-control').length
    insertedItem[4].classList.add(`mc-choices-${n}`);
    insertedItem[2].classList.add(`mc-choices-${n}`);

    addedDropdown.addEventListener('change', function(event) {
      if (this.value === "radio"){
        associatedChoiceBtn.classList.remove("mc-hidden");
        insertedItem[4].classList.add("mc-choice-bump-height");
      } else {
        associatedChoiceBtn.classList.add("mc-hidden");
        insertedItem[4].classList.remove("mc-choice-bump-height");
      };
    })
  }
});

$('#questions').on('cocoon:after-remove', function(e, insertedItem) {
  let kill = `.${insertedItem["0"].classList[1]}`
  document.querySelector(kill).remove();
});
