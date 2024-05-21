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
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(212,148, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.device_battery, Gfx.TEXT_JUSTIFY_CENTER);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(69, 121, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.calories, Gfx.TEXT_JUSTIFY_LEFT);
     
        dc.setColor(Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);
        dc.drawText(57,200, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.steps, Gfx.TEXT_JUSTIFY_CENTER);

        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(108,222, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.distance, Gfx.TEXT_JUSTIFY_CENTER);

        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(151,23, Gfx.FONT_SYSTEM_XTINY, bodyDeviceData.body_battery, Gfx.TEXT_JUSTIFY_CENTER);
	}

}