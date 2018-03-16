import "bootstrap";
import { autocomplete } from '../components/autocomplete';
autocomplete();

import { toggleForm } from '../components/form_new_warehouse';

if (document.querySelector(".certification-choices")) {
  toggleForm();
};

import { toggleCheckbox } from '../components/filters';

 if (document.getElementById("filters")) {
  toggleCheckbox();
  }


import "../plugins/flatpickr";

