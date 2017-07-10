//
//  TestToastViewController.swift
//  testPop
//
//  Created by darren on 2017/7/5.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class TestToastViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func clickBtn(_ sender: Any) {
        PopViewUtil.showMessage(msg: "测试测试哈测试测试哈测试测试哈测试测试哈测试测试哈测试测试哈", success: true, onView: self.topView, duration: 1)
    }
    @IBAction func clickbackbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
