<form id="cityForm" action="CityServlet" method="POST" class="pure-form pure-form-aligned">
	<fieldset>
		<legend></legend>
		<div class="pure-control-group">
			<label for="authors">Name</label>
			<input type="text" id="name" name="name" >
		</div>
		<div class="pure-control-group">
			<label for="code">Latitude</label>
			<input id="latitude" type="text" name="latitude" >
		</div>
		<div class="pure-control-group">
			<label for="name">Longitude</label>
			<input id="longitude" type="text" name="longitude" >
		</div>
		<input id="idd" name="id" type="hidden" value=""/>
		<input type="hidden" name="action" id="action" value="">
	</fieldset>
</form>