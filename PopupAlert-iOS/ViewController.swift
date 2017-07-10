//
//  ViewController.swift
//  testPop
//
//  Created by darren on 2017/6/28.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var titleArr = ["弹框(标题、内容、左右按钮)","弹框(内容、左右按钮)","弹框(内容、一个按钮)","弹框(内容、一个按钮)","展示纯文本，在window上默认2s","展示纯文本，在指定view上。指定3s","展示有图片的成功消息，默认在window上，默认2s","展示有图片的失败消息，在指定view上，指定3s","测试纯文本文字较多的情况","测试含有图片的文本文字较多的情况","禁止动画","动画打开","测试文本为空","弹框测试","文本框测试"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "ID"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ID)
        }
        cell?.textLabel?.text = titleArr[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            PopViewUtil.alert(title: "提水", message: "服务失败失服务失败失败服务失败失败服务失败失败服务失败失败服务失败失败服务失败失败服务失败失败服务失败失败服务失败失败服务失败失败败", leftTitle: "取消", rightTitle: "确定", leftHandler: {
                print("左")
            }, rightHandler: { 
                print("右")
            })
            
        } else if indexPath.row == 1 {
            PopViewUtil.alert(message: "服务器登服务器登服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败录失败录失败", leftTitle: "取消", rightTitle: "确定", leftHandler: {
                print("左")
            }, rightHandler: {
                print("右")
            })
        
        }else if indexPath.row == 2 {
            PopViewUtil.alert(message: "测试左边按钮置为空", leftTitle: "", rightTitle: "确定", leftHandler: {
                print("左")
            }, rightHandler: {
                print("右")
            })

        }
        else if indexPath.row == 3 {
            PopViewUtil.alert(message: "测试右边按钮置为空", leftTitle: "确定", rightTitle: "", leftHandler: {
                print("左")
            }, rightHandler: {
                print("右")
            })
        }
        else if indexPath.row == 4 {
            PopViewUtil.showMessage(msg: "展示纯文本，在window上默认2s")
        }
        else if indexPath.row == 5 {
            PopViewUtil.showMessage(msg: "展示纯文本，在指定view上。指定3s", success: nil, onView: self.view, duration: 13)
        }
        else if indexPath.row == 6 {
            PopViewUtil.showMessage(msg: "展示有图片的成功消息，默认在window上，默认2s", success: true, onView: nil, duration: nil)
        }
        else if indexPath.row == 7 {
            PopViewUtil.showMessage(msg: "展示有图片的失败消息，在指定view上，指定3s", success: false, onView: self.view, duration: 3)
        }
        else if indexPath.row == 8 {
            PopViewUtil.showMessage(msg: "展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s展示纯文本，在window上默认2s")
        }
        else if indexPath.row == 9 {
            PopViewUtil.showMessage(msg: "展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s展示有图片的成功消息，默认在window上，默认2s", success: true, onView: nil, duration: nil)
        }
        else if indexPath.row == 10 {
            // 由于是单例，所以如果想在某一个界面禁止动画其余界面还要打开动画，就需要再合适的地方设置其为0.8
            HDToast.share.animationFromValue = 1
            PopViewUtil.showMessage(msg: "禁止动画")
        }
        else if indexPath.row == 11 {
            HDToast.share.animationFromValue = 0.8
            PopViewUtil.showMessage(msg: "动画打开")
        }
        else if indexPath.row == 12 {
            PopViewUtil.showMessage(msg: "")
        }
        else if indexPath.row == 13 {
        }
        else if indexPath.row == 14 {
            let toast = TestToastViewController(nibName: "TestToastViewController", bundle: nil)
            self.present(toast, animated: true, completion:  nil)
        }
    }
}



