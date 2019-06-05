let survAddClick = (id) => {
  document.querySelector(`#surv-id-${id}`).addEventListener('click', function(event) {
    document.querySelectorAll('.surv-card').forEach(function(element) { element.classList.remove('surv-card-active') });
    document.querySelector(`#surv-id-${id}`).classList.add("surv-card-active");

    Rails.ajax({
      url: `/surveys/${id}`,
      type: "get",
      data: "ajax=1",
      success: function(data) {
        Rails.$('.right-page')[0].innerHTML = data.html
        // SCRIPT TAG not evaluated on innerHTML injection
        // eval() does that below
        document.querySelectorAll('.exec-chart-js').forEach(function(element) {
          eval(element.firstElementChild.innerHTML)
        })

      },
      error: function(data) {
        alert(`Failed to Load Critiq id: ${id} :(`)
      }
    })
  })
};

export { survAddClick }
