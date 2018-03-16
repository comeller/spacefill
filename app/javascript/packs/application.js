import "bootstrap";
import { autocomplete } from '../components/autocomplete';
autocomplete();

import { toggleForm } from '../components/form_new_warehouse';

if (document.querySelector(".certification-choices")) {
  toggleForm();
}

import "../plugins/flatpickr";
import "../components/googlechart";
