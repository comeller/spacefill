import swal from 'sweetalert';

function alertCancel() {
  document.querySelectorAll('.swal-cancel').forEach((cancelButton) => {
    cancelButton.addEventListener('click', (e) => {
      const bookingId = e.currentTarget.dataset.bookingId;
      const target = document.getElementById(`cancel-booking_${bookingId}`);
      swal({
        title: "Are you sure?",
        text: "Once canceled, you will not be able to recover your booking!",
        icon: "warning",
        buttons: true,
        dangerMode: true
      })
      .then((willCancel) => {
        if (willCancel) {
          target.click();
        } else {
          swal("Your booking is safe!");
        }
      });
    });
  });
}

export { alertCancel };
