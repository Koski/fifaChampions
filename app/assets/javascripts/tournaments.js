
$(document).ready(ready);
$(document).on('page:load', ready);

function ready() {
	$('#participantAmount').change(addFields);
	addFields()
	function addFields() {
		var num = $('#participantAmount').val();
		var participantInputs = $('#participantInputs').html('');
		var template = $('#inputTemplate').html();
		for (var i = 1; i <= num; i++) {
			var $standing = $('<input/>', {type:'hidden', name: 'tournament[tournament_stats_attributes][][standing]', value: i});
			$standing.appendTo(participantInputs);
			participantInputs.append(i+'.'+template);
		}
	}
}

