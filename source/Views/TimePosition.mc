using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
import Toybox.Lang;


class TimePosition extends Ui.Drawable{

    var dc;
    var device_w_h as Array<Number>;

    var cur_year as Array<Number>;
    var cur_month as Array<Number>;
    var cur_week as Array<Number>;
    var cur_day as Array<Number>;
    var cur_time as Array<Number>;

    function initialize(_dc){
        dc = _dc;
        Drawable.initialize(_dc);
    }
    function year_location() {
        
    }
    function month_location() {

    }
    function week_location() {
        
    }
    function day_location() {
        
    }
    function time_location() {
        
    }
    
    function customDrawTime(dc, x, pozition, colour, data, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,pozition, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }
}