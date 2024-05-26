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
            var time = new TimePosition(dc);
            drawMonthDay(time);
            drawSec(time);
            var font = Ui.loadResource(Rez.Fonts.sgks);
            time.time_set(timeData.timeString, font); 
	}
        //绘制几月几日
        function drawMonthDay(time) {
           var test = Ui.loadResource(Rez.Fonts.FZSHIGKSK);
           time.month_day_set(timeData.monthDay, test);
           time.week_set(timeData.weekDay,test);
        }

        function drawSec(time) {
           var secFont = Ui.loadResource(Rez.Fonts.id_font_clock_sec);  
           time.sec_set(timeData.secString, secFont);
        }
      function drawWeek(time) {
           var weekFont = Ui.loadResource(Rez.Fonts.FZSHIGKSK);  
           time.sec_set(timeData.secString, weekFont);
        }      
      
}