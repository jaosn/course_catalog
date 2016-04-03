// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  var countText = 0;
  $("#search_form input").keyup(function(){
    $.get($("#search_form").attr("action"),$("#search_form").serialize(),null,"script");
    countText ++;
    console.log("Input changes made" + countText);
    return false;
  });
  $("#search_subject").change(function(){
    $.get($("#search_form").attr("action"),$("#search_form").serialize(),null,"script");
    return false;
  });
});
