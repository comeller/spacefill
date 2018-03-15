function toggleForm() {
  const certif_choices = document.querySelectorAll(".certification-choice");
  const serv_choices = document.querySelectorAll(".service-choice");

  certif_choices.forEach((choice) => {
    choice.addEventListener("click", (event) => {
      const targetId = event.currentTarget.dataset.target;
      const boolean = document.getElementById(targetId).value;
      if (boolean == "false") {
        document.getElementById(targetId).value = true;
        // console.log(document.getElementById(targetId).value);
      } else {
        document.getElementById(targetId).value = false;
        // console.log(document.getElementById(targetId).value);
      }
      // document.getElementById(targetId).value = !boolean;
      event.currentTarget.classList.toggle('active');
    });
  });

  serv_choices.forEach((choice) => {
    choice.addEventListener("click", (event) => {
      const targetId = event.currentTarget.dataset.target;
      const boolean = document.getElementById(targetId).value;
      // document.getElementById(targetId).value = !boolean
      if (boolean == "false") {
        document.getElementById(targetId).value = true;
        // console.log(document.getElementById(targetId).value);
      } else {
        document.getElementById(targetId).value = false;
        // console.log(document.getElementById(targetId).value);
      }
      event.currentTarget.classList.toggle('active');
    });
  });
}

export { toggleForm };
