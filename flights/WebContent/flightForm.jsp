<form id="flightForm" action="FlightServlet" method="POST" class="pure-form pure-form-aligned">
	<fieldset>
		<legend></legend>
		<div class="pure-control-group">
			<label for="name">Airplane type</label>
			<input id="airplane_type" type="text" name="airplane_type" >
		</div>
		<div class="pure-control-group">
			<label for="code">Departure city</label>
			<input id="departure_city" type="text" name="departure_city" >
		</div>
		<div class="pure-control-group">
			<label for="price">Departure date</label>
			<input id="departure_time" name="departure_time" type="text" class="datetimeinput" >
		</div>
		<div class="pure-control-group">
			<label for="authors">Arrival city</label>
			<input type="text" id="arrival_city" name="arrival_city" >
		</div>
		<div class="pure-control-group">
			<label for="isbn">Arrival date</label>
			<input type="text" class="datetimeinput" id="arrival_time" name="arrival_time" >
		</div>
		<input id="id" name="id" type="hidden" value=""/>
		<input type="hidden" name="action" value="">
	</fieldset>
</form>