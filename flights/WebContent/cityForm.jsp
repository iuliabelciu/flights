<form id="cityForm" action="CityServlet" method="POST" class="pure-form pure-form-aligned">
	<fieldset>
		<legend></legend>
		<div id="div.error"></div>
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

<script type="text/javascript">
var $ = jQuery;
$("#save").attr('disabled','disabled');    
var isName = false;

$("#name").focusout(function(){
	if (allLetter($("#name").val())){
		isName=true;
		updateSubmit();
	}else{
		isName=false;
		$("#name_error").html('Name must have alphabet characters only');  
	}
 });
 
 $("#name").click(function(){
	$("#name_error").html('');
 });
 
function allLetter(value)  {   
	var letters = /^[A-Za-z]+$/;  
	if(value.match(letters)) {  
		return true;  
	}  
	else {  
	return false;  
  }
};

function allNumbers(value) {

	var numbers = /^[0-9]+$/;  
	if(value.match(numbers))  {  
		return true;  
	}  
	else  {   
		return false;  
	}  
};

 function updateSubmit(){
	if(isName){
		$("#submit_button").removeAttr('disabled');
	}
 };
</script>
