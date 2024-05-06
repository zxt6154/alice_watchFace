import Toybox.Lang;
using Toybox.System as Sys;

class TimeUtil{

    // var monthDict = {};
    // function convertMonth() {
    //         monthDict["Month"] = "0";
    //         monthDict["JANUARY"] = "一月";
    //         monthDict["FEBRUARY"] = "二月";
    //         monthDict["Mar"] = "三月";
    //         monthDict["APRIL"] = "四月";
    //         monthDict["MAY"] = "五月";
    //         monthDict["JUNE"] = "六月";
    //         monthDict["JULY"] = "七月";
    //         monthDict["AUGUST"] = "八月";
    //         monthDict["SEPTEMBER"] = "九月";
    //         monthDict["OCTOBER"] = "十月";
    //         monthDict["NOVEMBER"] = "十一月";
    //         monthDict["DECEMBER"] = "十二月";

    //     }

    public var monthArrayZhs = ["Month", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"] as Array<String>;
    public var monthDayArrayZhs = ["MonthDay","一号","二号", "三号", "四号", "五号", "六号", "七号", "八号", "九号", "十号", "十一号", "十二号", "十三号", "十四号", "十五号", "十六号", "十七号", "十八号", "十九号", "廿号", "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十", "三一"] as Array<String>;

    public var weekArray = ["Week","周日", "周一", "周二", "周三", "周四", "周五", "周六"] as Array<String>;

    public var monthArray = ["Month", "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"] as Array<String>;
    public var monthDayArray = ["MonthDay","1号", "2号", "3号", "4号", "5号", "6号", "7号", "8号", "9号", "10号", "11号", "12号", "13号", "14号", "15号", "16号", "17号", "18号", "19号", "20号", "21号", "22号", "23号", "24号", "25号", "26号", "26号", "27号", "28号", "29号", "30号", "31号"] as Array<String>;

    function curTime(witch, param) {
        var str = "err";
         
        if(witch.equals("monthArray")) {
            Sys.println("monthArray witch => " + witch);
            Sys.println("monthArray param => " + param);
            str = monthArray[param];
        }
        if(witch.equals("weekArray")) {
            Sys.println("weekArray witch => " + witch);
            Sys.println("weekArray param => " + param);
            str = weekArray[param];
        }
        if(witch.equals("monthDayArray")) {
            Sys.println("monthDayArray witch => " + witch);
            Sys.println("monthDayArray param => " + param);
            str = monthDayArray[param];
        }

        if(witch.equals("monthArrayZhs")) {
            str = monthArrayZhs[param];
        }
        if(witch.equals("monthDayArrayZhs")) {
            str = monthDayArrayZhs[param];
        }
        return str;
    }
}
