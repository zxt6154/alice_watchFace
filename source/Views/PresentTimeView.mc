using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;
import Toybox.Lang;

class PresentTimeView extends Ui.Drawable{
        var timeUtil;
	function initialize(params){
                timeUtil = new TimeUtil();
                Drawable.initialize(params);
        }
     
	function draw(dc)
	{
                var font = Ui.loadResource(Rez.Fonts.sgks);
                var secFont = Ui.loadResource(Rez.Fonts.id_font_clock_sec);
                var clockTime = Sys.getClockTime();
                var now = Time.now();
                var date = Calendar.info(now, Time.FORMAT_LONG);
                var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
                var secString = Lang.format("$1$", [clockTime.sec.format("%02d")]);

                var months = Ui.loadResource(Rez.Strings.Months);
                var today = currentTime();
                var day = today.day;
                var yearMonth = Lang.format("$1$ $2$ $3$", [timeUtil.monthArray[today.month], timeUtil.monthDayArray[day], timeUtil.weekArray[today.day_of_week]]);
                var test = Ui.loadResource(Rez.Fonts.FZSHIGKSK);
                var timer1 = new TimePosition(dc);
                timer1.year_set(yearMonth, test);
                timer1.time_set(timeString, font); 
                timer1.sec_set(secString, secFont);
	}
	function currentTime(){
                var clockTime = Sys.getClockTime();     
                var t = Time.now();
                // if (properties.useDayLightSavingTime) {	
                //         var offset = new Time.Duration(clockTime.dst);
                //         t=t.add(offset);
                // }		
                var today = Calendar.info(t, Time.FORMAT_SHORT);
                return today;
	}
      
}