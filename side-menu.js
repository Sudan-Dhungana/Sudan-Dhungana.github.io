var open_menu = document.getElementById("open-menu");
var close_menu = document.getElementById("close-menu");
var side_menu = document.getElementById("side-menu");

close_menu.onclick = function() {
    side_menu.style.display = "none";
}

open_menu.onclick = function() {
    side_menu.style.display = "flex";
}