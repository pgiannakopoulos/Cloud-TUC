function ConfirmDelete() {
      return confirm('Are you sure you want to do this?');
    }
    
$(document).ready(function(){
    $('.search-box input[type="text"]').on("keyup input", function(){
        /* Get input value on change */
        var inputVal = $(this).val();
        var resultDropdown = $(".result");
        var default_table = "<table>\
                    <tr>\
                        <th><strong>ID</strong></th>\
                        <th><strong>Name</strong></th>\
                        <th><strong>Surname</strong></th>\
                        <th><strong>Father's name</strong></th>\
                        <th><strong>Grade</strong></th>\
                        <th><strong>Mobile number</strong></th>\
                        <th><strong>Birthday</strong></th>\
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
        	//resultDropdown.empty();
            resultDropdown.html(default_table);
        }
    });
    
    // // Set search input value on click of result item
    // $(document).on("click", ".result p", function(){
    //     $(this).parents(".search-box").find('input[type="text"]').val($(this).text());
    //     $(this).parent(".result").empty();
    // });
});