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
    var cur_sec = new Array<Number>[2];

    function initialize(_dc){
        dc = _dc;
       // var x = (dc.getWidth() / 2);
       device_w_h[0] = dc.getWidth();
       device_w_h[1] = dc.getHeight();

       //Drawable.initialize(_dc);
    }
    function month_day_set(monthDayStr,test) {
        cur_year[0] = 100;
        cur_year[1] = 32;
        customDrawTime(dc, cur_year[0], cur_year[1], Gfx.COLOR_WHITE, monthDayStr, test);
    }

    function week_set(weekDayStr,test) {
        cur_week[0] = 205;
        cur_week[1] = 122;
        customDrawTime(dc, cur_week[0], cur_week[1], Gfx.COLOR_WHITE, weekDayStr, test);
    }

    function month_set() {

    }
    function day_set() {
        
    }
    function sec_set(secString, secFont) {
        var x = device_w_h[0]/2;
        cur_sec[0] = x+x/3 +15;
        var textDim = dc.getTextDimensions(secString, secFont);
        cur_sec[1] = device_w_h[1]/3 - textDim[1] / 2 ;
        customDrawTime(dc, cur_sec[0], cur_sec[1], Gfx.COLOR_DK_GRAY, secString, secFont);
    }
    function time_set(timeString, font) {
        cur_time[0] = device_w_h[0]/2 - 30;
        var textDim = dc.getTextDimensions(timeString, font);

        var textDim1 = dc.getTextWidthInPixels(timeString, font);
        Sys.println("textDim[0] - " + textDim1);
        cur_time[1] = device_w_h[1]/3 - textDim[1] / 2;
        customDrawTime(dc, cur_time[0], cur_time[1], Gfx.COLOR_WHITE, timeString, font);
    }
    
    function customDrawTime(dc, x, y, colour, data, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,y, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }
}