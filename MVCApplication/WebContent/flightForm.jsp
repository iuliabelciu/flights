<form id="flightForm" action="RegisterServlet" method="POST" class="pure-form pure-form-aligned">
	<fieldset>
		<legend></legend>
		<div class="pure-control-group">
			<label for="name">Airplane type</label>
			<input type="text" name="airplane_type" >
		</div>
		<div class="pure-control-group">
			<label for="code">Departure city</label>
			<input type="text" name="departure_city" >
		</div>
		<div class="pure-control-group">
			<label for="price">Departure date</label>
			<input type="text" class="datepicker" name="departure_time" >
		</div>
		<div class="pure-control-group">
			<label for="price">Departure time</label>
			<input type="text" class="timepicker" name="departure_hours" >
		</div>
		<div class="pure-control-group">
			<label for="authors">Arrival city</label>
			<input type="text" name="arrival_city" >
		</div>
		<div class="pure-control-group">
			<label for="isbn">Arrival date</label>
			<input type="text" class="datepicker" name="arrival_time" >
		</div>
		<div class="pure-control-group">
			<label for="isbn">Arrival time</label>
			<input type="text" class="timepicker" name="arrival_hours" >
		</div>
		<input name="id" type="hidden" value=""/>
		<input type="hidden" name="action" value="">
	</fieldset>
</form>