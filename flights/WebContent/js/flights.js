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
	departure_time=(departure_time).replace(".0","");
	arrival_time=(arrival_time).replace(".0","");
	departure_time=(departure_time).replace("-","/");
	arrival_time=(arrival_time).replace("-","/");
	departure_time=(departure_time).replace("-","/");
	arrival_time=(arrival_time).replace("-","/");
	$('#departure_time').val(departure_time);
	$('#arrival_time').val(arrival_time);
}

function deleteFlight(id){
	$('#confirmDeleteDialog').dialog("option", "title", 'Delete Flight');
	$('#confirmDeleteDialog').dialog('open');	
	$('#iddelete').val(id);
}
function addCity() {
	$('#cityDialog').dialog("option", "title", 'Add City');
	$('#cityDialog').dialog('open');
}

function editCity(id, name, longitude, latitude, action) {
	$('#cityDialog').dialog("option", "title", 'Edit City');
	$('#cityDialog').dialog('open');	
	$('#idd').val(id);
	$('#name').val(name);
	$('#longitude').val(longitude);
	$('#latitude').val(latitude);
	$('#action').val(action);
}

function getTimeZone(id, name, latitude, longitude, action) {
	$('#cityDialog').dialog("option", "title", 'Time zone for city:');
	$('#cityDialog').dialog('open');	
	$('#idd').val(id);
	$('#name').val(name);
	$('#name').prop('readonly', true);
	$('#longitude').val(longitude);
	$('#longitude').prop('readonly', true);
	$('#latitude').val(latitude);
	$('#latitude').prop('readonly', true);
	$('#action').val(action);
}

function deleteCity(id){
	$('#confirmDeleteDialog').dialog("option", "title", 'Delete City');
	$('#confirmDeleteDialog').dialog('open');	
	$('#iddelete').val(id);
}

function initializeDatePicker() {
	$(".datepicker").datepicker({
		dateFormat : "yyyy/dd/mm",
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

	$('#cityDialog').dialog({

		autoOpen : false,
		position : 'center',
		modal : true,
		resizable : false,
		width : 600,
		buttons : {
			"Save" : function() {
				$('#cityForm').submit();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		},
		close : function() {

			resetDialog($('#cityForm'));

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
	$('#confirmDeleteCity').dialog({

		autoOpen : false,
		position : 'center',
		modal : true,
		resizable : false,
		width : 600,
		buttons : {
			"Delete" : function() {
				$('#confirmDeleteCity').submit();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		},
		close : function() {

			resetDialog($('#confirmDeleteCity'));

			$(this).dialog('close');
		}
	});
	
	initializeDatePicker();
	$('.datetimeinput').datetimepicker();
	


});
