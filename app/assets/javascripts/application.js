//= require jquery
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$('form#new_comment').on('submit', function(){
    console.log(this)
    console.log($.this)
});

$('form').submit(function(){
    console.log('lol')
});