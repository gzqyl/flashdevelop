import flash.events.KeyboardEvent;
import flash.text.TextField;
import flash.text.TextFormat;

// 1. Setup a display label to show the key presses
var statusField:TextField = new TextField();
statusField.width = 500;
statusField.height = 100;
statusField.x = 50;
statusField.y = 50;

var format:TextFormat = new TextFormat();
format.size = 24;
format.font = "Arial";
statusField.defaultTextFormat = format;
statusField.text = "Press a required key (1,2,3,4, Space, P, M, Esc, WASD)";
addChild(statusField);

// 2. Listen for keyboard events
stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);

function onKeyPress(event:KeyboardEvent):void {
    var pressed:String = "";
    
    // Map the KeyCodes to their visual names
    switch(event.keyCode) {
        case 49: pressed = "1"; break;
        case 50: pressed = "2"; break;
        case 51: pressed = "3"; break;
        case 52: pressed = "4"; break;
        case 32: pressed = "Space"; break;
        case 80: pressed = "P"; break;
        case 77: pressed = "M"; break;
        case 27: pressed = "Escape"; break;
        case 87: pressed = "W"; break;
        case 65: pressed = "A"; break;
        case 83: pressed = "S"; break;
        case 68: pressed = "D"; break;
        default:
            pressed = "Other Key (Code: " + event.keyCode + ")";
    }
    
    statusField.text = "Last Key Pressed: " + pressed;
    trace("Key Pressed: " + pressed);
}
