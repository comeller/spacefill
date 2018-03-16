import "bootstrap";
import { autocomplete } from '../components/autocomplete';
autocomplete();

import { toggleForm } from '../components/form_new_warehouse';

if (document.querySelector(".certification-choices")) {
  toggleForm();
};

import { toggleCheckbox, toggleInput } from '../components/filters';

 if (document.getElementById("filters")) {
  toggleCheckbox();
  toggleInput();
  }


import "../plugins/flatpickr";
import "../components/googlechart";

import { alertCancel } from '../components/sweet_alert';
alertCancel();
