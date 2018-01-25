$("#estado").change(function() {
	estado_id = $(this).val();

	$.ajax({
	  type:"PATCH",
	  url:"/buscacidades",
	  dataType:"json",
	  data: {estado: estado_id},
	  success:function(result){
	    //adicionar opções ao dropdown e habilitar o mesmo
	    $('#cidade').html('');
	    var i = 0;
	    for (i = 0; i < result.length; i++) {
		    $('#cidade').append('<option value="' + result[i].id + '">' + result[i].nome + '</option>');
		  }
		  $('#cidade').prop('disabled', false);
	  }
	});
	
});