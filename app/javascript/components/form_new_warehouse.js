function toggleForm() {
  const choices = document.querySelectorAll(".checkbox-customize");

  choices.forEach((choice) => {
    choice.addEventListener("click", (event) => {
      event.preventDefault();
      event.currentTarget.classList.toggle("active");
    });
  });
}

export { toggleForm };
