<form id="cityForm" action="CityServlet" method="POST" class="pure-form pure-form-aligned">
	<fieldset>
		<legend></legend>
		<div class="pure-control-group">
			<label for="authors">Name</label>
			<input type="text" id="arrival_city" name="name" >
		</div>
		<div class="pure-control-group">
			<label for="name">Longitude</label>
			<input id="airplane_type" type="text" name="longitude" >
		</div>
		<div class="pure-control-group">
			<label for="code">Latitude</label>
			<input id="departure_city" type="text" name="latitude" >
		</div>
		<input id="id" name="id" type="hidden" value=""/>
		<input type="hidden" name="action" value="">
	</fieldset>
</form>