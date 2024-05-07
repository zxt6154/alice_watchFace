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
                // Get and show the current time
                var font = Ui.loadResource(Rez.Fonts.sgks);
                var secFont = Ui.loadResource(Rez.Fonts.id_font_clock_sec);
                var clockTime = Sys.getClockTime();
                var now = Time.now();
                var date = Calendar.info(now, Time.FORMAT_LONG);
                var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
                var secString = Lang.format("$1$", [clockTime.sec.format("%02d")]);
                //decodeNumber(format, options)

                var months = Ui.loadResource(Rez.Strings.Months);
                var today = currentTime();
           
                var day = today.day;
                var yearMonth = Lang.format("$1$ $2$ $3$", [timeUtil.monthArray[today.month], timeUtil.monthDayArray[day], timeUtil.weekArray[today.day_of_week]]);
                //var yearMonth = Lang.format("$1$ $2$", [date.month, date.day]);
        //        var view = View.findDrawableById("TimeLabel");
                var textDim = dc.getTextDimensions(timeString, font);
                
                // Sys.println(textDim[1]);
                var x = (dc.getWidth() / 2);
                var real_middle = dc.getHeight() / 3;
                var middle_position = (real_middle) - textDim[1] / 2;
                // Sys.println(dc.getHeight());
                var top_pozition = (real_middle / 1.5) - textDim[1] ;
                var bottom_pozition = (real_middle + real_middle / 3);
        /*        if ( colour == 0 ) {
                dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
                }else if (colour == 1) {
                dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
                }*/
                var fontMgbz = Ui.loadResource(Rez.Fonts.mgbz);
                var test = Ui.loadResource(Rez.Fonts.FZSHIGKSK);
                customDrawText(75, dc, Gfx.COLOR_WHITE, yearMonth, 153, test);
                
        // customDrawText(x, dc, Gfx.COLOR_WHITE, "STEPS", top_pozition + 21, stringFont);
                customDrawText(x-30, dc, Gfx.COLOR_WHITE, timeString, middle_position, font);

                customDrawText(x+x/3 +10, dc, Gfx.COLOR_LT_GRAY, secString, middle_position+20, secFont);
                //customDrawText(x, dc, Gfx.COLOR_WHITE, "PRESENT  TIME", middle_position + 21, stringFont);
                // customDrawText(x, dc, Gfx.COLOR_DK_GREEN, yearMonth, bottom_pozition, test);
                //customDrawText(x, dc, Gfx.COLOR_WHITE, "STEPS", bottom_pozition + 21, stringFont);

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
      
	function customDrawText(x, dc, colour, data, pozition, font){
                dc.setColor(colour, Gfx.COLOR_BLACK);
                dc.drawText(x,pozition, font, data, Gfx.TEXT_JUSTIFY_CENTER);
        }
	
}