using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as ActMon;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.Sensor as Sor;
using Toybox.SensorHistory as Sh;
using Toybox.Weather as CurWeather;
using Toybox.Position as Pos;
using Toybox.Time.Gregorian;

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
     var cur_weather;
     var cur_local;
     var cur_temperature;

     var cur_temperature2;
     //心率
     var heartPuls;
     var activityInfo = ActMon.getInfo();
     
     var curCondition = CurWeather.getCurrentConditions();
     //初始化的时候将活动信息传参
     function initialize() {
          steps = activityInfo.steps;
          calories = activityInfo.calories;
          distance = activityInfo.distance;
          device_battery = Sys.getSystemStats().battery.format("%d") + "%";
          //distUnits = Sys.getDeviceSettings().distanceUnits; 
          cur_weather = curCondition.condition;
          heartPulsCur();
          bodyBatteryCur();
          caloriesActCur();
          weatherLocal();
          temperatureCur();
     }

    function heartPulsCur() {
       if (getHeartRate() == null){
          heartPuls = "-";
          }
        else if(getHeartRate() == 255){
          heartPuls = "-";
          }
        else{
          heartPuls = getHeartRate().toString();
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
        heartRate = value == null ? "--" : value.format("%d");
        return heartRate;
    }
    function getHeartRateIterator() {
	    if ((Toybox has :SensorHistory) && (Toybox.SensorHistory has :getHeartRateHistory)) {
	        return Toybox.SensorHistory.getHeartRateHistory({:order=>SensorHistory.ORDER_NEWEST_FIRST,:period=>1});
	    }
	    return null;
	}


    function bodyBatteryCur() {
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


    function caloriesActCur() {
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);		
        var profile = UserProfile.getProfile();
        var age = today.year - profile.birthYear;
        var weight = profile.weight / 1000.0;
        var restCalories=0, adj=0.5;

        if (profile.gender == UserProfile.GENDER_MALE) {
            restCalories = 5.2 - 6.116*age + 7.628*profile.height + 12.2*weight;
        } else {// female
            restCalories = -197.6 - 6.116*age + 7.628*profile.height + 12.2*weight;
        }

        if(today.hour>=18){ adj=0; }
        restCalories = Math.round(((today.hour*60+today.min) * restCalories / 1440 ) - adj).toNumber();
        calories_act =ActivityMonitor.getInfo().calories - restCalories;
       
    }


    function weatherLocal() {
    
        if(curCondition!=null and curCondition.observationLocationName!=null) {
            var location = curCondition.observationLocationName;
            if (location.length()>15 and location.find(",")!=null){
                location = location.substring(0,location.find(","));
            }
            if (location.find("location[")!=null){
                location="null";
            }				
            if (location.find("null")!=null and location.find(",")!=null) {
                var location2 = location.substring(0,location.find(","));
                if (location2.find("null")!=null) {
                    location2 = location.substring(location.find(",")+2,location.length());
                    if (location2.find("null")!=null){
                        location2 = "";
						}
					}
					location = location2;
				}
				else if (location.find("null")!=null) {
					location = "";
				}

				cur_local = "location: "+location;
			}
    }
    function temperatureCur() {
// var TempMetric = System.getDeviceSettings().temperatureUnits;
        var TempMetric  = System.UNIT_METRIC;
		var temp=null, units = "", minTemp=null, maxTemp=null;
		var weather = Weather.getCurrentConditions();
     
	    if ((weather.lowTemperature!=null) and (weather.highTemperature!=null)){ // and weather.lowTemperature instanceof Number ;  and weather.highTemperature instanceof Number
			minTemp = weather.lowTemperature;
            Sys.println("minTemp - " + minTemp);
			maxTemp = weather.highTemperature;
            Sys.println("maxTemp - " + maxTemp);
		}
    	if (weather!=null and (weather.temperature!=null)) { //feels like ;  and weather.temperature instanceof Number
                if (TempMetric == System.UNIT_METRIC) { //Celsius or Storage.getValue(16)==true
                    units = "°C";
                    temp = weather.temperature;
                    Sys.println("temperature1 - " + temp);
                }	else {
                    temp = (weather.temperature * 9/5) + 32; 
                    if (minTemp!=null and maxTemp!=null){
                        minTemp = (minTemp* 9/5) + 32;
                        maxTemp = (maxTemp* 9/5) + 32;
                    }
                    //temp = Lang.format("$1$", [temp.format("%d")] );
                    units = "°F";
                }				
		    } else if(weather!=null and (weather.temperature!=null)) {  // real temperature ;  and weather.temperature instanceof Number
				if (TempMetric == System.UNIT_METRIC ) { //Celsius or Storage.getValue(16)==true
					units = "°C";
					temp = weather.temperature;
				}	else {
					temp = (weather.temperature * 9/5) + 32; 
					if (minTemp!=null and maxTemp!=null){
						minTemp = (minTemp* 9/5) + 32;
						maxTemp = (maxTemp* 9/5) + 32;
					}
					//temp = Lang.format("$1$", [temp.format("%d")] );
					units = "°F";
				}
		    }
        temp=temp.format("%d")+units;
        cur_temperature = temp;
    }
}