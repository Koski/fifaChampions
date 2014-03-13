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


$(document).on('page:load', ready);
$(document).ready(ready);

function ready() {

  var participants = document.getElementById("participantAmount");
  for (var i = 0; i <= 8; i++) {
    var option = document.createElement("option");
    option.text = i;
    option.value = i;
    participants.appendChild(option);
  };

  $('#participantAmount').change(function() {
    var participants = $(this).val();
    addFields(participants);
  });


}

function addFields(num) {
     var participantInputs = document.getElementById("participantInputs");
     participantInputs.innerHTML = '';
     for (var i = 1; i <= num; i++) {
        participantInputs.innerHTML += i + ". ";
        
        var inputUser = document.createElement("select");
        inputUser.name = "stats[tournament_stats_" + i +"][user_id]";
        var inputTeam = document.createElement("select");
        inputTeam.name = "stats[tournament_stats_"+ i +"][team_id]";

        addUsers(inputUser);
        addTeams(inputTeam);
        var standing = document.createElement("input");
        standing.name = "stats[tournament_stats_"+ i +"][standing]";
        standing.setAttribute("type", "hidden");
        standing.value = i;
        participantInputs.appendChild(standing);
        participantInputs.appendChild(inputUser);
        participantInputs.appendChild(inputTeam);
        participantInputs.appendChild(document.createElement("br"));
    }
}

function addTeams(inputTeam) {
  for (var i = 0; i < teams.length; i++) {
    var option = document.createElement("option");
    option.text = teams[i].name;
    option.value = teams[i].id;
    inputTeam.appendChild(option);
  };
}

function addUsers(inputUser) {
  for (var i = 0; i < users.length; i++) {
    var option = document.createElement("option");
    option.text = users[i].username;
    option.value = users[i].id;
    inputUser.appendChild(option);
  };
}

