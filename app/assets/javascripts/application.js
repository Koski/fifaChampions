// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
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

    $(function() {
        var participants = document.getElementById("participantAmount");
        for (var i = 1; i <= 8; i++) {
            var option = document.createElement("option");
            option.text = i;
            option.value = i;
            participants.appendChild(option);
        };
        console.log(users[0].username)
    });

    $('#participantAmount').change(function() {
        var participants = $(this).val();
        addFields(participants);
    });

    function addFields(num) {
       var participantInputs = document.getElementById("participantInputs");
       participantInputs.innerHTML = '';
       for (var i = 1; i <= num; i++) {
          participantInputs.innerHTML += i + ". "
          var inputUser = document.createElement("select");
          var inputTeam = document.createElement("select");
          inputUser.appendChild(document.createElement("option"));
          inputTeam.appendChild(document.createElement("option"));
          participantInputs.appendChild(inputUser);
          participantInputs.appendChild(inputTeam);
          participantInputs.appendChild(document.createElement("br"));
      }
  }

});
