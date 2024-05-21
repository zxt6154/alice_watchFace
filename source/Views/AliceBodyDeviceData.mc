using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as ActMon;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.Sensor as Sor;
using Toybox.SensorHistory as Sh;

//个人检测数据 心率｜热量｜身体电量｜步数｜...
class AliceBodyDeviceData {
     //步数
     var steps;
     //设备电量
     var device_battery;
     //身体电量
     var body_battery;
     //卡路里
     var calories;
     //卡路里
     var calories_act;
     var distance;
     var distUnits;
     //心率
     var heartPuls;
     var activityInfo = ActMon.getInfo();


     //初始化的时候将活动信息传参
     function initialize() {
          steps = "step: " + activityInfo.steps;
          calories = "calories: " + activityInfo.calories;
          distance = "distance: " + activityInfo.distance;
          device_battery = "db: " + Sys.getSystemStats().battery.format("%d") + "%";
          distUnits = Sys.getDeviceSettings().distanceUnits; 
          heartPuls_cur();
          body_battery_cur();
     }

    function heartPuls_cur() {
       if (getHeartRate() == null){
          heartPuls = "-";
          }
        else if(getHeartRate() == 255){
          heartPuls = "-";
          }
        else{
          heartPuls = "heartPuls: " + getHeartRate().toString();
          }
    }
    private function getHeartRate() {// initialize it to null
        var heartRate = null;// Get the activity info if possible
        var value = Activity.getActivityInfo();
        if (value != null){
            value = value.currentHeartRate;
         }

        if (value == null){
            value = getHeartRateIterator();
            if  ( value != null ){
                value = value.next();
                value = value == null ? null : value.data;
            }
        }
        Sys.println("heartbeat => "+value);
        heartRate = value == null ? "--" : value.format("%d");
        return heartRate;
    }
    function getHeartRateIterator() {
	    if ((Toybox has :SensorHistory) && (Toybox.SensorHistory has :getHeartRateHistory)) {
	        return Toybox.SensorHistory.getHeartRateHistory({:order=>SensorHistory.ORDER_NEWEST_FIRST,:period=>1});
	    }
	    return null;
	}


    function body_battery_cur() {
       if (getBodyBattery() == null){
          body_battery = "-";
       }else{
          body_battery = "bb: " + getBodyBattery().toString();
       }
    }




    function getBodyBattery() {
        var bosyBattery = null;// Get the activity info if possible
        var value = Activity.getActivityInfo();
      	if (value != null){
			value = value.currentPower;
		}

        if (value == null){
            value = getIterator();
            if  ( value != null ){
                value = value.next();
                value = value == null ? null : value.data;
            }
        }
        Sys.println("bosyBattery => "+value);
        bosyBattery = value == null ? "--" : value.format("%d");
        return bosyBattery;
    }
    // Create a method to get the SensorHistoryIterator object
    function getIterator() {
        // Check device for SensorHistory compatibility
        if ((Toybox has :SensorHistory) && (Toybox.SensorHistory has :getBodyBatteryHistory)) {
            // Set up the method with parameters
            return Toybox.SensorHistory.getBodyBatteryHistory({});
        }
        return null;
    }


     function calories_act_cur() {
       return null;    
     }

    
}