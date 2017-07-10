//
//  PopViewUtil.swift
//  testPop
//
//  Created by darren on 2017/6/28.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class PopViewUtil: NSObject {
    
//MARK: - 以下代码用于显示SVProgressHUD，当引入项目中时，注意把以下代码打开即可
//    public override class func initialize(){
//        SVProgressHUD.setErrorImage(UIImage(named: "ic_toast_warning"))
//        SVProgressHUD.setSuccessImage(UIImage(named: "ic_toast_success"))
//        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
//        SVProgressHUD.setBackgroundColor(UIColor(redValue: 22, green: 27, blue: 35, alpha: 0.75))
//        SVProgressHUD.setBackgroundLayerColor(UIColor.clear)
//        SVProgressHUD.setCornerRadius(6)
//        SVProgressHUD.setForegroundColor(UIColor.white)
//        SVProgressHUD.setInfoImage(UIImage(named: "df"))
//        SVProgressHUD.setMaximumDismissTimeInterval(2.5)
//        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
//    }
//    
//    //MARK: - 网路加载转转
//    public static func showLoading(){
//        
//        if HDToast.share.isShowing() {
//            HDToast.share.dismiss()
//        }
//        SVProgressHUD.show()
//    }
//    
//    ///取消对话的方法
//    public static func dismiss() {
//        SVProgressHUD.dismiss()
//    }
//    public static func showLoading(message: String? = nil) {
//        message == nil ? SVProgressHUD.show() : SVProgressHUD.show(withStatus: message)
//    }
    
    
    //MARK: - Returns: 当前控制器
    static func getCurrentViewcontroller() -> UIViewController?{
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        if let tabController = rootController as? UITabBarController   {
            if let navController = tabController.selectedViewController as? UINavigationController{
                return navController.childViewControllers.last
            }else{
                return tabController
            }
        }else if let navController = rootController as? UINavigationController {
            
            return navController.childViewControllers.last
        }else{
            
            return rootController
        }
    }
    
    //MARK: - 标准的样式(标题，内容，左按钮，右按钮)
    static func  alert(title: String!,message: String!,leftTitle: String!,rightTitle: String!,leftHandler: (() -> ())?,rightHandler: (() -> ())?){
        let alertVC = HDAlertViewController()
        alertVC.alert(title: title, message: message, leftTitle: leftTitle, rightTitle: rightTitle, leftHandler: leftHandler, rightHandler: rightHandler)
    }
    
    //MARK: - 只有内容，左按钮，右按钮 或者只显示一个按钮
    static func  alert(message: String!,leftTitle: String!,rightTitle: String!,leftHandler: (() -> ())?,rightHandler: (() -> ())?){
        let alertVC = HDAlertViewController()
        alertVC.alert(message: message, leftTitle: leftTitle, rightTitle: rightTitle, leftHandler: leftHandler, rightHandler: rightHandler)
    }
}

//MARK: - toast相关
extension PopViewUtil {
    
    // 展示在指定view上，默认2秒
    static func showMessage(msg: String?,onView: UIView?) {
        HDToast.share.showMessage(msg: msg, inView: onView, duration: nil)
    }
    
    /// 含有成功或者失败的消息，success为nil表示显示纯文本，需要显示的父控件不传默认展示的window上，显示时间不传默认为2s
    static func showMessage(msg: String?,success: Bool? = nil,onView: UIView? = nil, duration:Int? = nil) {
        if success == nil {
            HDToast.share.showMessage(msg: msg, inView: onView, duration: duration)
        } else {
            HDToast.share.showSuccessMessage(msg: msg, success: success!, inView: onView, duration: duration)
        }
    }

}
