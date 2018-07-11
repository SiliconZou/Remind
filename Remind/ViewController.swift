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
        
        SZNotiManager.shareNoti().SZNotificationWith(hour: 18, minute: 16, title: "dinner", alertBody: "time to dinner", notiId: "qwe")
        SZNotiManager.shareNoti().SZNotificationWith(hour: 18, minute: 17, title: "training", alertBody: "time to run", notiId: "PM")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

