//
//  ViewController.swift
//  Remind
//
//  Created by SiliconZou on 2018/7/9.
//  Copyright © 2018年 MSTech Co.,Ltd. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
        
        let notiCenter = UNUserNotificationCenter.current()
        
        notiCenter .requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
            if granted == true {
                self.SZNotificationWith(hour: 22, minute: 34, alertBody: "该洗白白了！")
            } else {
                print("用户禁止通知")
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SZNotificationWith(hour:Int?, minute:Int?, alertBody:String?) {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        let notiCenter = UNUserNotificationCenter.current()
        
        let notiContent = UNMutableNotificationContent.init()
        
        notiContent.title = "小可爱请注意"
        
        if alertBody != nil {
            notiContent.body = alertBody!
        } else {
            notiContent.body = ""
        }
        
        notiContent.badge = 1
        
        notiContent.sound = UNNotificationSound.default()
        
        var compoents = DateComponents.init()
        
        compoents.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        compoents.hour = hour!
        
        compoents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: compoents, repeats: true)
        
        let request = UNNotificationRequest.init(identifier: "notificationAM", content: notiContent, trigger: trigger)
        
        notiCenter .add(request) { (error) in
            print(error.debugDescription)
        }
        
    }


}

