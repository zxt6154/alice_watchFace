using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
import Toybox.Lang;

class PresentTimeView extends Ui.Drawable{
        var timeData;
	function initialize(params){
            timeData = new TimeData();
            Drawable.initialize(params);
        }
     
	function draw(dc){
            var font = Ui.loadResource(Rez.Fonts.sgks);
            var secFont = Ui.loadResource(Rez.Fonts.id_font_clock_sec);                
            var test = Ui.loadResource(Rez.Fonts.FZSHIGKSK);
            var timer1 = new TimePosition(dc);
            timer1.year_set(timeData.todayYearMonth, test);
            timer1.time_set(timeData.timeString, font); 
            timer1.sec_set(timeData.secString, secFont);
	}

      
}