

  function toggleCheckbox() {
    const checkboxes = document.querySelectorAll(".checkbox")
    console.log(checkboxes)
    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener("click", (event) => {
      document.getElementById('filters').submit();
      })
    });
  }

  export { toggleCheckbox }

