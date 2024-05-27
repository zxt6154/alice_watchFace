using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as ActMon;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.Sensor as Sor;
using Toybox.ActivityMonitor as Monitor;
using Toybox.SensorHistory as Sh;

//页面展示
class AliceView extends Ui.Drawable {  
    
    var activityInfo = ActMon.getInfo(); 
    var bodyDeviceData;

	function initialize(params){
        bodyDeviceData = new AliceBodyDeviceData();
		Drawable.initialize(params);
	}
 
	function draw(dc){

    //     dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    //     dc.drawText(212,148, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.device_battery, Gfx.TEXT_JUSTIFY_CENTER);
   
     
    //     dc.setColor(Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);
    //     dc.drawText(57,200, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.steps, Gfx.TEXT_JUSTIFY_CENTER);

    //     dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
    //     dc.drawText(108,222, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.cur_local, Gfx.TEXT_JUSTIFY_CENTER);

    //     dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
    //     dc.drawText(151,23, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.body_battery, Gfx.TEXT_JUSTIFY_CENTER);

    //     //cur_weather
    //     dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
    //     dc.drawText(132,193, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.cur_weather, Gfx.TEXT_JUSTIFY_CENTER);
    //    //cur_temp
    //    dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
    //    dc.drawText(118,53, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.cur_temperature, Gfx.TEXT_JUSTIFY_CENTER);

       var info = System.getDeviceSettings();
       var widthDc = dc.getWidth()-1;
       var heightDc = dc.getHeight()-1;
      
    //    var options = {
    //         :locX => 0,
    //         :locY => 0,
    //         :width => 0,
    //         :height => 0,
    //         :tintColor => Gfx.COLOR_TRANSPARENT
    //     };
       drawCalAct(dc, widthDc, heightDc);
       drawCal(dc, widthDc, heightDc);
       drawDeviceBattery(dc, widthDc, heightDc);
       drawHeartPul(dc, widthDc, heightDc);
       drawHeartPul(dc, widthDc, heightDc);
       drawBodyBattery(dc, widthDc, heightDc);
	}


    function drawHeartPul(dc, widthDc, heightDc) {
        var xinlvSvg = Application.loadResource( Rez.Drawables.xinlv);
        var widthxinlv = xinlvSvg.getHeight();
        var xinlvx = widthDc/2 + widthxinlv/2;
        var xinlvy = widthxinlv-widthxinlv/2;
        dc.drawBitmap(xinlvx, xinlvy, xinlvSvg);
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
        dc.drawText(xinlvx+widthxinlv, xinlvy, Gfx.FONT_SYSTEM_TINY, bodyDeviceData.heartPuls, Gfx.TEXT_JUSTIFY_LEFT);
         Sys.println("xinlvX " + xinlvx+widthxinlv + " 2*xinlvy "+2*xinlvy);
      
    }

    function drawDeviceBattery(dc, widthDc, heightDc) {
        var deviceBatterySvg = Application.loadResource( Rez.Drawables.battery_full);
        var widthDeviceBattery = deviceBatterySvg.getHeight();
        var deviceBatteryx = widthDc/2-2*widthDeviceBattery;
        var deviceBatteryy = widthDeviceBattery/2;
        dc.drawBitmap(deviceBatteryx, deviceBatteryy, deviceBatterySvg);
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
        dc.drawText(deviceBatteryx+widthDeviceBattery,deviceBatteryy, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.device_battery, Gfx.TEXT_JUSTIFY_LEFT);
      
    }


    function drawCalAct(dc, widthDc, heightDc) {
         var actCalSvg = Application.loadResource( Rez.Drawables.act_cal);
        var widthActCal = actCalSvg.getHeight();
        var actCalx = widthDc/2;
        var actCaly = heightDc-widthActCal;
        dc.drawBitmap(actCalx, actCaly, actCalSvg);
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
        dc.drawText(actCalx+widthActCal,actCaly, Gfx.FONT_SYSTEM_TINY, bodyDeviceData.calories_act, Gfx.TEXT_JUSTIFY_LEFT);
    }

    function drawCal(dc, widthDc, heightDc) {
         var caloriesSvg = Application.loadResource( Rez.Drawables.calories);
        var widthCalories = caloriesSvg.getHeight();
        var caloriesx = widthDc*2/3;
        var caloriesy = heightDc*1/2 + widthCalories;
        dc.drawBitmap(caloriesx, caloriesy, caloriesSvg);
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
        dc.drawText(caloriesx+widthCalories, caloriesy, Gfx.FONT_SYSTEM_TINY, bodyDeviceData.calories, Gfx.TEXT_JUSTIFY_LEFT); 
    }
    function drawBodyBattery(dc, widthDc, heightDc) {
        var bodyBatterySvg = Application.loadResource( Rez.Drawables.body_battery);
        var widthBodyBattery = bodyBatterySvg.getHeight();
        var bodyBatteryx = widthDc*2/3;
        var bodyBatteryy = heightDc*4/5 - widthBodyBattery;
        dc.drawBitmap(bodyBatteryx, bodyBatteryy, bodyBatterySvg);
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
        dc.drawText(bodyBatteryx+widthBodyBattery, bodyBatteryy, Gfx.FONT_SYSTEM_TINY, bodyDeviceData.body_battery, Gfx.TEXT_JUSTIFY_LEFT); 
      
    }

}