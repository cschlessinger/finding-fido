$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

 //= require jquery
 //= require jquery-ui
 //= require bootstrap
 //= require_tree .

  $(function() {
    $("#tabs").tabs();

    $("#dog_toggle1").show()
    // $("#dog_toggle1").toggle('slow')
    $("#dog_toggle2").show()
    $("#dog_toggle3").show()

 	});
});
