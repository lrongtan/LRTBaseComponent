//
//  ViewController.swift
//  LRTBaseComponent
//
//  Created by 李荣潭 on 05/06/2022.
//  Copyright (c) 2022 李荣潭. All rights reserved.
//

import UIKit
import LRTBaseComponent

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo()
        kf_demo()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func demo() {
        print("中英文 效验====== 结果===",RegularExpUtil.isCE(value: "的几哈见客户给dddd"))
        
        print("中英文数字正则 效验====== 结果===",RegularExpUtil.isCEN(value: "ddfgg3333a定积分"))
        GlobalProgressHUD.showHUDText(title: "测试调用方法")
    }
    
    private func kf_demo() {
        let btn = UIButton()
        btn.kf.kf_run()
    }
}

