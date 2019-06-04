// $('#rows').on('cocoon:after-insert', function(e) {
//    var dropdown_id = 'dynamic_dropdown-' + $('.pane_dropdown').size();
//
//     $(this).find('.fa-plus-square').attr('data-toggle', dropdown_id);
//     $(this).find('.dropdown-pane').attr('id', dropdown_id);
//     $(this).find('.pane_dropdown').foundation();
// })
//
//


//

const addListenerDropdown = () => {
  console.log('Hi!');
  const mcFormDropdown = document.querySelector('.form-control.select.optional');
  mcFormDropdown.addEventListener('change', function (event) {
    console.log(`dropdown listened to`)
    let current_elements = document.querySelectorAll('.form-control.select.optional');
    for (let n = 0; n === current_elements.length - 1; n++) {
      current_elements[n].classList.add(`mc-dropdown-${n}`)

      // document.querySelector(`mc-dropdown-${n}`) .addEventListener('change',
    }
  });
}

export default addListenerDropdown




// if (this.value === "radio"){
//   document.querySelector('.mc-form-create-link').classList.remove("mc-hidden");
//   document.querySelector('.create-form-choices').classList.add("mc-choice-bump-height");
// } else {
//   document.querySelector('.mc-form-create-link').classList.add("mc-hidden");
//   document.querySelector('.create-form-choices').classList.remove("mc-choice-bump-height");
// };
