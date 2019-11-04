function ConfirmDelete() {
	return confirm('Are you sure you want to delete this student?');
}

function ConfirmEdit() {
	return confirm('Are you sure you want to edit this student?');
}

function ConfirmLogout() {
	return confirm('Are you sure you want to logout?');
}
    
$(document).ready(function(){
    $('.search-box input[type="text"]').on("keyup input", function(){
        /* Get input value on change */
        var inputVal = $(this).val();
        var resultDropdown = $(".result");
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

$(window).on("load", function () {
    document.addEventListener("DOMContentLoaded", function (event) {
        var element = document.getElementByTag('body');
        var height = element.offsetHeight;
        if (height < screen.height) {
            document.getElementById("footer").classList.add('stikybottom');
        }
    }, false);
});