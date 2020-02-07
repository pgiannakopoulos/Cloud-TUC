
//Confirmation funtions
function ConfirmDelete() {
	return confirm('Are you sure you want to delete this student?');
}

function ConfirmEdit() {
	return confirm('Are you sure you want to edit this student?');
}

function ConfirmLogout() {
	return confirm('Are you sure you want to logout?');
}

//Asynchronous Search of student    
$(document).ready(function(){
    $('.search-box input[type="text"]').on("keyup input", function(){
        
        /* Get input value on change */
        var inputVal = $(this).val();
        var resultDropdown = $(".result");

        //Default message 
        var default_table = "<table>\
                    <tr>\
                        <th style='width: 15%'><strong>ID</strong></th>\
                        <th style='width: 15%'><strong>Name</strong></th>\
                        <th style='width: 15%'><strong>Surname</strong></th>\
                        <th style='width: 15%'><strong>Father's name</strong></th>\
                        <th style='width: 10%'><strong>Grade</strong></th>\
                        <th style='width: 15%'><strong>Mobile number</strong></th>\
                        <th style='width: 15%'><strong>Birthday</strong></th>\
                    </tr>\
                    <tr>\
                        <td colspan='7' style='text-align: center;'>Search something...</td>\
                    </tr>\
                </table>";

        if(inputVal.length){
            $.get("backend-search.php", {term: inputVal}).done(function(data){
                
                // Display the returned data in browser
                resultDropdown.html(data);
            });
        } else{
            resultDropdown.html(default_table);
        }
    });
});

 // function to set the height of content on fly to keep footer on the bottom.
 function autoHeight() {
   $('#content').css('min-height', 0);
   $('#content').css('min-height', (
     $(document).height() - $('#header').height() - $('#footer').height()
   ));
 }

 // onDocumentReady function bind
 $(document).ready(function() {
   autoHeight();
 });

 // onResize bind of the function
 $(window).resize(function() {
   autoHeight();
 });

