// $('#questions').on('cocoon:after-insert', function(e, insertedItem) {
//   if (insertedItem.length === 5 && insertedItem[4].id === "choices") {
//     let addedDropdown = insertedItem[2].lastElementChild.children["0"].children[1]
//     let associatedChoiceBtn = insertedItem[4].lastElementChild
//     let n = document.querySelectorAll('.select.optional.form-control').length
//     insertedItem[4].classList.add(`mc-choices-${n}`);
//     insertedItem[2].classList.add(`mc-choices-${n}`);
//
//     addedDropdown.addEventListener('change', function(event) {
//       if (this.value === "radio"){
//         associatedChoiceBtn.classList.remove("mc-hidden");
//         insertedItem[4].classList.add("mc-choice-bump-height");
//       } else {
//         associatedChoiceBtn.classList.add("mc-hidden");
//         insertedItem[4].classList.remove("mc-choice-bump-height");
//       };
//     })
//   }
// });
//
//
// $('#questions').on('cocoon:after-remove', function(e, insertedItem) {
//   let kill = `.${insertedItem["0"].classList[1]}`
//   document.querySelector(kill).remove();
// });

//
// const cocoonCallbacks = () => {
//   const questionDiv = document.querySelector('#questions')
//   if (questionDiv){
//
//     console.log('Cocoon Callbacks Called');
//
//     questionDiv.addEventListener('cocoon:after-insert', function(e, insertedItem) {
//       console.log('Event After Insert');
//       if (insertedItem.length === 5 && insertedItem[4].id === "choices") {
//         let addedDropdown = insertedItem[2].lastElementChild.children["0"].children[1]
//         let associatedChoiceBtn = insertedItem[4].lastElementChild
//         let n = document.querySelectorAll('.select.optional.form-control').length
//
//         insertedItem[4].classList.add(`mc-choices-${n}`);
//         insertedItem[2].classList.add(`mc-choices-${n}`);
//
//         addedDropdown.addEventListener('change', function(event) {
//           if (this.value === "radio"){
//             associatedChoiceBtn.classList.remove("mc-hidden");
//             insertedItem[4].classList.add("mc-choice-bump-height");
//           } else {
//             associatedChoiceBtn.classList.add("mc-hidden");
//             insertedItem[4].classList.remove("mc-choice-bump-height");
//           };
//         })
//       }
//     });
//
//     questionDiv.addEventListener('cocoon:after-remove', function(e, insertedItem) {
//       let kill = `.${insertedItem["0"].classList[1]}`
//       document.querySelector(kill).remove();
//     });
//   }
// };
//
// export { cocoonCallbacks }
