using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
import Toybox.Lang;


class TimePosition extends Ui.Drawable{

    var dc;
    // as Array<Number> or null;
    var device_w_h = new Array<Number>[2];

    var cur_year = new Array<Number>[2];
    var cur_month = new Array<Number>[2];
    var cur_week = new Array<Number>[2];
    var cur_day = new Array<Number>[2];
    var cur_time = new Array<Number>[2];

    function initialize(_dc){
        dc = _dc;
       //Drawable.initialize(_dc);
    }
    function year_set(yearMonth,test) {
        cur_year[0] = 75;
        cur_year[1] = 153;
        customDrawTime(dc, cur_year[0], cur_year[1], Gfx.COLOR_WHITE, yearMonth,  test);
    }
    function month_set() {

    }
    function week_set() {
        
    }
    function day_set() {
        
    }
    function time_set() {
        
    }
    
    function customDrawTime(dc, x, y, colour, data, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,y, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }
}