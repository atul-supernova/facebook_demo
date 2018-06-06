// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
  $(document).ready(function() {
    FB.init({
      appId      : '1801301740177204',
      xfbml      : true,
      version    : 'v2.2'
    });
  });  
  
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1801301740177204',
      xfbml      : true,
      version    : 'v2.6'
    });

    FB.Event.subscribe('messenger_checkbox', function(e) {
      console.log("messenger_checkbox event");
      console.log(e);
      
      if (e.event == 'rendered') {
        console.log("Plugin was rendered");
      } else if (e.event == 'checkbox') {
        var checkboxState = e.state;
        console.log("Checkbox state: " + checkboxState);
      } else if (e.event == 'not_you') {
        console.log("User clicked 'not you'");
      } else if (e.event == 'hidden') {
        console.log("Plugin was hidden");
      }
      
    });
  }; 

