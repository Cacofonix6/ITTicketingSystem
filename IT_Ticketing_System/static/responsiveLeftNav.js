/**
 * When the logout link is clicked on any page, this method is called to ensure the user really does want to click.
 * If true is returned the user is redirected to the login page.
 */

function responsiveLeftNav() 
{
    var x = document.getElementById("leftNavBar");
    if (x.className === "col left") {
        x.className += " responsive";
    } else {
        x.className = "col left";
    }
}