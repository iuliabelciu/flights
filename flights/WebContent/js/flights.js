function addFlight() {
	$('#flightDialog').dialog("option", "title", 'Add Flight');
	$('#flightDialog').dialog('open');
}

function editFlight(id, airplane_type, departure_city, arrival_city, departure_time, arrival_time) {
	$('#flightDialog').dialog("option", "title", 'Edit Flight');
	$('#flightDialog').dialog('open');	
	$('#id').val(id);
	$('#airplane_type').val(airplane_type);
	$('#arrival_city').val(arrival_city);
	$('#departure_city').val(departure_city);
	$('#departure_time').val(departure_time);
	$('#arrival_time').val(arrival_time);
}

function deleteFlight(id){
	$('#confirmDeleteDialog').dialog("option", "title", 'Delete Flight');
	$('#confirmDeleteDialog').dialog('open');	
	$('#idd').val(id);
}

function initializeDatePicker() {
	$(".datepicker").datepicker({
		dateFormat : "yyyy-dd-mm",
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

	$('#confirmDeleteDialog').dialog({

		autoOpen : false,
		position : 'center',
		modal : true,
		resizable : false,
		width : 600,
		buttons : {
			"Delete" : function() {
				$('#confirmDelete').submit();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		},
		close : function() {

			resetDialog($('#confirmDelete'));

			$(this).dialog('close');
		}
	});
	initializeDatePicker();

	$('.datetimeinput').datetimepicker();
});
