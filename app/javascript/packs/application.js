import "bootstrap";
import "chart.js";
// import "@shopify/draggable";
// import "autosize";
// import "dropzone";
// import "flatpickr";
// import "highlight.js";
// import "highlightjs";
import "jquery-mask-plugin";
// import "list.js";
import "popper.js";
// import "quill";


import '../components/dashkit';
// import '../components/autosize';
// import '../components/charts-dark';
import '../components/charts';
// import '../components/demo';
import '../components/dropdowns';
// import '../components/dropzone';
// import '../components/flatpickr';
// import '../components/highlight';
// import '../components/kanban';
// import '../components/list';
// import '../components/map';
import '../components/navbar';
// import '../components/polyfills';
import '../components/popover';
// import '../components/quill';
import '../components/select2';
import '../components/tooltip';



import $ from 'jquery';
import 'select2';                       // globally assign select2 fn to $ element
import 'select2/dist/css/select2.css';  // optional if you have css loader

// JS for landingpage
import { scrollTo } from '../components/smooth_scroll';
import { showNav } from '../components/show_navbar'

// JS for Edit Page
import { editTitleField } from '../components/edit_page_loader';
// import { survAddClick } from '../components/surv_card_onclick';





$(() => {
  $('#survey_channel_id').select2();
});

// Not working yet
// autosize(document.querySelectorAll('textarea'));

// function calls for landingpage
scrollTo();
showNav();
// function calls for Edit Page
editTitleField();
