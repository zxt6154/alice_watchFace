using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as ActMon;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.Sensor as Sor;

class ActivityView extends Ui.Drawable
{   
    
    var activityInfo = ActMon.getInfo(); 
    var steps;
    var stepsGoal;
    var calories;
    var distance; 
    var distUnits = Sys.getDeviceSettings().distanceUnits; 
    var xinlv;
    var caloriesSvg;
    var footStepSvg;
    var batteryFullSvg;
    var heartPuls;
	function initialize(params)
	{
		Drawable.initialize(params);
        steps = convertData(activityInfo.steps);
        stepsGoal = convertData(activityInfo.stepGoal);
        calories = convertData(activityInfo.calories);
        distance = convertDistance(activityInfo.distance);  
        
        if (getHeartRate() == null){heartPuls = "0";}
        else if(getHeartRate() == 255){heartPuls = "0";}
        else{heartPuls = getHeartRate().toString();}

        xinlv = Application.loadResource( Rez.Drawables.xinlv);
        caloriesSvg = Application.loadResource( Rez.Drawables.calories);
        footStepSvg = Application.loadResource( Rez.Drawables.foot_step);
        batteryFullSvg = Application.loadResource( Rez.Drawables.battery_full);
	}
    private function getHeartRate() {// initialize it to null
        var heartRate = null;// Get the activity info if possible
        var info = Activity.getActivityInfo();
      
        if (info != null) {
            heartRate = info.currentHeartRate;
        } else { // Fallback to `getHeartRateHistory`
            var latestHeartRateSample = ActivityMonitor.getHeartRateHistory(1, true).next();
            if (latestHeartRateSample != null) {
                heartRate = latestHeartRateSample.heartRate;
            } } // Could still be null if the device doesn't support it
        return heartRate;
  }
	function draw(dc)
	{
        // Get and show the current time
        var font = Ui.loadResource(Rez.Fonts.id_font_clock_sec);
 
        var textDim = dc.getTextDimensions(steps, font);
        var x = (dc.getWidth()*4 / 5);
        var stepsX = (dc.getWidth() *4/ 7);
        var heartPulsX = (dc.getWidth() *4/ 7 + 6);
        var stepsGoalX = (dc.getWidth() / 3) + 5;
        var caloriesX = (dc.getWidth() / 2) + 50;
        var distanceX = (dc.getWidth() / 2) + 65;
        var real_middle = dc.getHeight() /2;  
        var top_pozition = (real_middle / 1.5) - textDim[1] ;      
        var activityData = [steps, stepsGoal, calories, distance];
        var xValues = [stepsX, stepsGoalX, caloriesX, distanceX];
        var stringData = ["ACTIVITY", "STEPS", "GOAL", "CALORIES", "DISTANCE"];
        // var drawView = new MainView();
        // var m = drawView.method(:mainDraw);
        // m.invoke(dc, x, xValues, top_pozition, activityData, stringData, textDim[1], Gfx.COLOR_ORANGE);

        // dc.setColor(Gfx.COLOR_ORANGE, Graphics.COLOR_TRANSPARENT);
        //  dc.drawText(
        //  dc.getWidth() / 2,                      // gets the width of the device and divides by 2
        //  dc.getHeight() / 2,                     // gets the height of the device and divides by 2
        //  Graphics.FONT_LARGE,                    // sets the font size
        //  "Hello World",                          // the String to display
        // Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
        //         );

         //customDrawText(x, dc, Gfx.COLOR_YELLOW, yearMonth, bottom_pozition, font);
       
         dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
         dc.drawText(212,148, font, heartPuls, Gfx.TEXT_JUSTIFY_CENTER);
         dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
         dc.drawText(x+10,caloriesX, font, calories, Gfx.TEXT_JUSTIFY_CENTER);

        // var x = ( dev.screenWidth - mySwirl.getWidth() ) / 2;
        // var y = ( dev.screenHeight - mySwirl.getHeight() ) / 2;
        //  // Initialize the Animation

        var info = System.getDeviceSettings();
        var width = (info.screenWidth * .60).toNumber() & ~0x3;
        var height = (info.screenHeight * .3).toNumber();
        var options = {
            :locX => 0,
            :locY => 0,
            :width => 0,
            :height => 0,
            :tintColor => Gfx.COLOR_DK_RED
        };
        dc.drawBitmap2(x-30, 176, caloriesSvg, options);

        // var options2 = {
        //     :locX => 0,
        //     :locY => 0,
        //     :width => 0,
        //     :height => 0,
        //     :tintColor => Gfx.COLOR_DK_RED
        // };
        // dc.drawBitmap2(x, 36, caloriesSvg, options2);

        var options3 = {
            :locX => 0,
            :locY => 0,
            :width => 0,
            :height => 0,
            :tintColor => Gfx.COLOR_WHITE
        };
        dc.drawBitmap2(x-30, 145, xinlv, options3);

        var options4= {
            :locX => 0,
            :locY => 0,
            :width => 0,
            :height => 0,
            :tintColor => Gfx.COLOR_DK_GREEN
        };
        dc.drawBitmap2(56, 28, batteryFullSvg, options4);

         var systemStats = System.getSystemStats();
        // var batteryStr = View.findDrawableById("systemStats") as Text;
        // batteryStr.setText(systemStats.battery.format("%d") + "%");
        dc.drawText(81, 28, Gfx.FONT_SYSTEM_XTINY, systemStats.battery.format("%d") + "%", Gfx.TEXT_JUSTIFY_LEFT);
	}

    function customDrawText(x, dc, colour, data, pozition, font){
        dc.setColor(colour, Gfx.COLOR_BLACK);
        dc.drawText(x,pozition, font, data, Gfx.TEXT_JUSTIFY_CENTER);
    }
	
	function convertData(datas)
	{
	    var data = datas.toString();
	    var length = data.length();
	        if ( length == 4 )
	        {
	            return  data.substring(0, 1) + 'K';
	        }
	        else if ( length == 5 )
            {
                return  data.substring(0, 2) + 'K';
            }
            else if ( length == 6 )
            {
               return data.substring(0, 3) + 'K';
            } else if ( length <= 3){
                return data;
            }
             else
            {
                return "Woow";
            }
	}
	
    function convertDistance(distance)
    {
     var distanceStr = "";
     if (distUnits == Sys.UNIT_METRIC)
        {
            if (distance >= 100000) {
                distanceStr = (distance * 0.01 * 0.001).format("%.1f") + "km";
            }
            else
            {
                distanceStr = (distance * 0.01).toLong() + "m";
            }
        }
        else
        {
            var feetDistance = distance * 0.0328084;
            if (feetDistance >= 5280)
            {
                distanceStr = (feetDistance / 5280.0).format("%.2f") + "mi";
            }
            else
            {
                distanceStr = (feetDistance).toLong() + "ft";
            }
        }
      return distanceStr;
    }

	
}