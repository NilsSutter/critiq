import "bootstrap";

import $ from 'jquery';
import 'select2';                       // globally assign select2 fn to $ element
import 'select2/dist/css/select2.css';  // optional if you have css loader

$(() => {
  $('#survey_channel_id').select2({
    theme: "bootstrap"
  });
});
