using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
import Toybox.Lang;

class DataPosition extends Ui.Drawable {

    var dc;
    var device_w_h as Array<Number>;

    var cur_heart_beat as Array<Number>;
    var cur_distance as Array<Number>;
    var cur_body_battery as Array<Number>;
    var cur_device_battery as Array<Number>;
    var cur_calories as Array<Number>;
    var cur_foot_step as Array<Number>;

    var cur_heart_beat_svg as Array<Number>;
    var cur_distance_svg as Array<Number>;
    var cur_body_battery_svg as Array<Number>;
    var cur_device_battery_svg as Array<Number>;
    var cur_calories_svg as Array<Number>;
    var cur_foot_step_svg as Array<Number>;

    function initialize(_dc){
        dc = _dc;
        Drawable.initialize(_dc);
    }
    
    function draw(dc){
        
    }

    function customDrawData(dc, x, pozition, colour, data, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,pozition, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }   
}