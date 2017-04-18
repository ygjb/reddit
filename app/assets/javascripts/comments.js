"use strict";
document.addEventListener("turbolinks:load", function () {
  try{
    var changeAnimation = null;
    let form = document.forms[0]; 
    if(form === undefined) throw "Form is not defined";
    if(getTextArea() === undefined) throw "xTextarea is not defined";
    form.addEventListener("submit", sendForm);
    $('form#new_comment').on("ajax:complete", function(event, xhr, status){
      getTextArea().value = ""
      changeAnimation("0","hidden");
      console.log(`Message sended! status code - ${status}`);
    });
  }catch(err){
    console.log(err);
  }
  function getTextArea(){
    return document.getElementsByTagName("textarea")[0];
  }
  function sendForm(evt){
    var textarea = getTextArea();
    if( textarea.value == "") {
      evt.preventDefault();
      console.log('Form is empty...');
      return false;
    }
    else if (textarea.value.length > 0) {
      changeAnimation("bounce_fountainG","visible");
    }
  }
  changeAnimation = function(name,stypeProperty){
    for (var value of document.querySelectorAll('.fountainG').values()) {
      value.style.animationName = name;
    }
    document.querySelector('#fountainG').style.visibility = stypeProperty;
  }
});