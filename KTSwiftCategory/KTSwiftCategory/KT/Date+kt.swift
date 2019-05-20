//
//  Date+kt.swift
//  HBean_Stu
//
//  Created by Kevin Tan on 2019/5/9.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

import Foundation

extension Date {
    //DateFormatString 转 date
    static func dateFromTimeStr(time:String) ->Date{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateformatter.date(from: time)!
    }
    
    //date 转 DateFormatString
    static func dateStrFormatFromDate(date:Date) ->String{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        return dateformatter.string(from: date)
    }
    //OldDateFormatString 转 NewDateFormatString
    static func newTimeStrFormOldTimeStr(time:String?,format:String) ->String{
        if let timeStr = time {
            let timeNSStr = timeStr as NSString
            if timeNSStr.length == 0 {return ""}
            let dateformatterA = DateFormatter()
            dateformatterA.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let newDate = dateformatterA.date(from: timeStr)!
            let dateformatterB = DateFormatter()
            dateformatterB.dateFormat = format
            return dateformatterB.string(from: newDate)
        }
        return ""
    }
    
    static func hybirdStar(dateStarStr:String,dateEndStr:String) ->String {
        let newBeginStr = Date.newTimeStrFormOldTimeStr(time: dateStarStr,format: "yyyy.MM.dd H:mm")
        let newEndStr = Date.newTimeStrFormOldTimeStr(time: dateEndStr,format: "H:mm")
        let hybirdStr = newBeginStr + "-" + newEndStr
        return hybirdStr
    }
    
    static func todayString() -> String {
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let todayStr = dateformatter.string(from: date)
        return todayStr
    }
    
    static func todayWeatherString() -> String {
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy.MM.dd"
        let todayStr = dateformatter.string(from: date)
        return todayStr
    }
    
    static func todayWeekString() -> String {
        let calendar = Calendar.current
        if let weekday = calendar.dateComponents([.weekday], from: Date()).weekday {
            //第一天是从星期天算起，weekday在 1~7之间
            //print((weekday + 5) % 7)
            switch weekday {
            case 1 :
                return "星期天"
            case 2 :
                return "星期一"
            case 3 :
                return "星期二"
            case 4 :
                return "星期三"
            case 5 :
                return "星期四"
            case 6 :
                return "星期五"
            case 7 :
                return "星期六"
            default:
                return "星期日"
            }
        }
        return ""
    }
    
    
    static func courseHeadTitle(string:String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let theDate = dateformatter.date(from:string)!
        //
        let dateformatterb = DateFormatter()
        dateformatterb.dateFormat = "MM月dd日"
        let todayStr = dateformatterb.string(from: theDate)
        //
        var weekDay = ""
        let calendar = Calendar.current
        if let weekday = calendar.dateComponents([.weekday], from:theDate).weekday {
            //第一天是从星期天算起，weekday在 1~7之间 print((weekday + 5) % 7)
            switch weekday {
            case 1 :
                weekDay = "星期天"
            case 2 :
                weekDay = "星期一"
            case 3 :
                weekDay = "星期二"
            case 4 :
                weekDay = "星期三"
            case 5 :
                weekDay = "星期四"
            case 6 :
                weekDay = "星期五"
            case 7 :
                weekDay = "星期六"
            default:
                weekDay = ""
            }
        }
        let result = todayStr + " " + weekDay
        return result
    }

    
    
}






