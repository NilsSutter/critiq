import "bootstrap";

import $ from 'jquery';
import 'select2';                       // globally assign select2 fn to $ element
import 'select2/dist/css/select2.css';  // optional if you have css loader
import scrollTo from '../components/smooth_scroll'

$(() => {
  $('#survey_channel_id').select2({
    theme: "classic"
  });
});

// $( "#slack-channels" ).select2({
//     theme: "bootstrap"
// });

scrollTo();

