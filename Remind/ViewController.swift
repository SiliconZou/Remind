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
        
//        SZNotiManager.shareNoti().SZNotificationWith(hour: 14, minute: 30, title: nil, alertBody: "tick tock", notiId: "PM")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            
        }
        
//        SZNotiManager.shareNoti().SZNotificationWith(hour: 22, minute: 36, title: "dinner", alertBody: "time to dinner", notiId: "qwe")
//        SZNotiManager.shareNoti().SZNotificationWith(hour: 21, minute: 37, title: "training", alertBody: "time to run", notiId: "PM")
        
        SZNotiManager.shareNoti().SZLocalNotiWith(aleretTime: "23:28", alertBody: "time to sleep")
        
        SZNotiManager.shareNoti().SZLocalNotiWith(aleretTime: "23:29", alertBody: "quikly!")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

