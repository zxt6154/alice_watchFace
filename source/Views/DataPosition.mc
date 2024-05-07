using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
import Toybox.Lang;

class DataPosition extends Ui.Drawable {

    var dc;
    var device_w_h = new Array<Number>[2];
    var cur_heart_beat = new Array<Number>[2];
    var cur_body_battery = new Array<Number>[2];
    var cur_device_battery = new Array<Number>[2];
    var cur_calories = new Array<Number>[2];
    var cur_foot_step = new Array<Number>[2];

    var cur_heart_beat_svg = new Array<Number>[2];
    var cur_distance_svg = new Array<Number>[2];
    var cur_body_battery_svg = new Array<Number>[2];
    var cur_device_battery_svg = new Array<Number>[2];
    var cur_calories_svg = new Array<Number>[2];
    var cur_foot_step_svg = new Array<Number>[2];

    function initialize(_dc){
        dc = _dc;
        Drawable.initialize(_dc);
    }
    
    function draw(dc){
        
    }
    function heart_beat_set() {
        
    }
    function distance_set() {

    }
    function body_battery_set() {
        
    }
    function device_battery_set() {
        
    }
    function calories_set() {
        
    }
    function foot_step_set() {
        
    }
    // ----
        function heart_beat_svg_set() {
        
    }
    function distance_svg_set() {

    }
    function body_battery_svg_set() {
        
    }
    function device_battery_svg_set() {
        
    }
    function calories_svg_set() {
        
    }
    function foot_step_svg_set() {
        
    }


    function customDrawData(dc, x, pozition, colour, data, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,pozition, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }   
}