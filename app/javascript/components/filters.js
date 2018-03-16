

  function toggleCheckbox() {
    const checkboxes = document.querySelectorAll(".checkbox")
    console.log(checkboxes)
    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener("click", (event) => {
      document.getElementById('filters').submit();
      })
    });
  }

  function toggleInput() {
    const inputs = document.querySelectorAll(".event-input")
    inputs.forEach((input) => {
      console.log("in event listener")
      input.addEventListener("blur", (event) => {
      document.getElementById('filters').submit();
      })
    });
  }

  export { toggleCheckbox, toggleInput }

