
$(document).ready(ready);

function ready() {
	$('#participantAmount').change(addFields);
	addFields()
	function addFields() {
		var num = $('#participantAmount').val();
		var participantInputs = $('#participantInputs').html('');
		var template = $('#inputTemplate').html();
		for (var i = 1; i <= num; i++) {
			participantInputs.append(i+'.'+template)
		}
	}
}

