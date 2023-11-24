// Import necessary module(s) from the GNOME Shell API
const { Main, GLib} = imports.gi;

// Store the default panel height
var panelHeight;

// Init function called when the extension is initialized
function init(){
    //get default panel height from Main panel object
    panelHeigh = Main.panel.get_height();    
}

// enable fuction called when extension is enabled
function enable(){
    //hide top panel by default when extension is enabled
    Main.panel.set_height(0);
}

// disable function called when extension is disabled
function disable(){
    //revert to default panel height when disabled
    Main.panel.set_height(panelHeight);
}

