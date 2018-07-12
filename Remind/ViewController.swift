//
//  ViewController.swift
//  Remind
//
//  Created by SiliconZou on 2018/7/9.
//  Copyright © 2018年 MSTech Co.,Ltd. All rights reserved.
//

/*
 列表展示完成项与未完成项
 
 */


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
        
//        SZNotiManager.shareNoti().SZNotificationWith(hour: 14, minute: 30, title: nil, alertBody: "tick tock", notiId: "PM")
        SZNotiManager.shareNoti().SZNotificationWith(hour: 10, minute: 22, title: "training", alertBody: "time to run", notiId: "AM")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            SZNotiManager.shareNoti().SZNotificationWith(hour: 10, minute: 23, title: "break", alertBody: "time to break", notiId: "PM")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

