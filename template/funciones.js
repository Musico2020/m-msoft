function mostrar(){
    $.ajax({
        type : "POST",
        url : "crudm/index.php",
        data : "",
        success : function(cont) {
            $("#contenido").html(cont);
           
        }
      });
     
    
}