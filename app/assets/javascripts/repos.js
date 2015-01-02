// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// For turbolinks

var ready = (function(){
    $('.readme-content').readmore();
});

$(document).ready(ready);
$(document).on('page:load', ready);
