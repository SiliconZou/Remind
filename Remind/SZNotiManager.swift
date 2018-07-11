//
//  SZNotiManager.swift
//  Remind
//
//  Created by Silicons Zou on 2018/7/11.
//  Copyright © 2018年 MSTech Co.,Ltd. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
class SZNotiManager: NSObject , UNUserNotificationCenterDelegate{
    
    private static let manager:SZNotiManager = SZNotiManager()
    class func shareNoti() -> SZNotiManager {
        return manager
    }
    
    var notiCenter : UNUserNotificationCenter!
    
    func requestPermission() {
        notiCenter = UNUserNotificationCenter.current()
        notiCenter.delegate = self
        notiCenter.requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
            if granted == true {
                print("有权限")
            } else {
                print("用户拒绝")
            }
        }
    }
    
    func localNotiRequest() {
        UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings.init(types: [.alert,.badge,.sound], categories: nil))
    }
    
    func SZLocalNotiWith(aleretTime:String?, alertBody:String) {
        
        let localNoti = UILocalNotification.init()
        let df = DateFormatter.init()
        df.date(from: "HH:mm")
        df.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        let date = df.date(from: aleretTime!)
        localNoti.fireDate = date
        
        localNoti.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        localNoti.alertBody = alertBody
        
        localNoti.applicationIconBadgeNumber = 1
        
        localNoti.soundName = UILocalNotificationDefaultSoundName
        
        localNoti.repeatInterval = NSCalendar.Unit.day
        
        UIApplication.shared.scheduleLocalNotification(localNoti)
    }
    
    func SZNotificationWith(hour:Int?, minute:Int?, title:String?, alertBody:String?, notiId:String?) {
        
        notiCenter.removeAllDeliveredNotifications()
        
        let notiContent = UNMutableNotificationContent.init()
        if title == nil {
            notiContent.title = ""
        } else {
            notiContent.title = title!
        }
        
        if alertBody == nil {
            notiContent.body = ""
        } else {
            notiContent.body = alertBody!
        }
        
        notiContent.badge = 1
        
        notiContent.sound = UNNotificationSound.default()
        
        var compoents = DateComponents.init()
        
        compoents.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        compoents.hour = hour
        
        compoents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: compoents, repeats: true)
        
        let request = UNNotificationRequest.init(identifier: notiId!, content: notiContent, trigger: trigger)
        
        notiCenter.add(request) { (error) in
            
            print(error.debugDescription)
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
}

