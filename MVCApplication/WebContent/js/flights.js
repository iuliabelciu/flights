function addFlight() {
	$('#flightDialog').dialog("option", "title", 'Add Flight');
	$('#flightDialog').dialog('open');
}

function editFlight(id) {

	$.get("get/" + id, function(result) {

		$("#bookDialog").html(result);

		$('#bookDialog').dialog("option", "title", 'Edit Book');

		$("#bookDialog").dialog('open');

		initializeDatePicker();
	});
}

function initializeDatePicker() {
	$(".datepicker").datepicker({
		dateFormat : "yy-mm-dd",
		changeMonth : true,
		changeYear : true,
		showButtonPanel : true
	});
}

function resetDialog(form) {

	form.find("input").val("");
}

$(document).ready(function() {

	$('#flightDialog').dialog({

		autoOpen : false,
		position : 'center',
		modal : true,
		resizable : false,
		width : 600,
		buttons : {
			"Save" : function() {
				$('#flightForm').submit();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		},
		close : function() {

			resetDialog($('#flightForm'));

			$(this).dialog('close');
		}
	});
	$('.timepicker').timepicker();
	initializeDatePicker();
});
