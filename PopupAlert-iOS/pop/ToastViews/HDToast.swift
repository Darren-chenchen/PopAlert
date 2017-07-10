//
//  HDToast.swift
//  testPop
//
//  Created by darren on 2017/6/29.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//
import UIKit

class HDToast: NSObject {
    
    static let share = HDToast()
    
    var textToastView: TextToast?   // 纯文本
    var imageToastView: ImageToast?  // 含有图片
    
    let window = UIApplication.shared.keyWindow
    // 屏幕宽度
    let APPH = UIScreen.main.bounds.height
    // 屏幕高度
    let APPW = UIScreen.main.bounds.width
    // 字体大小(修改字体直接修改此参数)
    let textFont: CGFloat = 16
    // 文本框两端的间隔
    let marginH: CGFloat = 10
    // 文本框两端的内部间隔
    let insideMaginH: CGFloat = 25
    // 文本框上下的间距
    let marginV: CGFloat = 15
    // 默认展示2秒
    let defultSecond = 2
    // 动画的开始大小fromValue，如果要禁止动画就设置其为1
    var animationFromValue: CGFloat = 0.8
    // 当文字太少的时候文本框比较短，但有时候需要文本框小于某一个值时固定宽度，就可以设置该参数
    let minLabelWidth: CGFloat = 120
    
    /// 纯文字展示
    func showMessage(msg:String?,inView:UIView? = nil, duration:Int? = nil) {
        self.show(msg:msg, inView:inView, duration: duration)
    }

    /// 展示有图片的文本框，inView=nil展示在window上，duration=nil，默认2秒
    func showSuccessMessage(msg:String?,success: Bool,inView:UIView? = nil, duration:Int? = nil) {
        self.show(msg:msg,success: success, inView: inView, duration: duration)
    }
    
    /// 以下方法的主要作用是如果界面上有多个显示控件比如SVprogressHUD同时出现时，将toast隐藏
    public func dismiss(){
        if self.textToastView != nil {
            self.textToastView?.removeFromSuperview()
        }
        if self.imageToastView != nil {
            self.imageToastView?.removeFromSuperview()
        }
    }
    public func isShowing() -> Bool {
        return self.textToastView != nil || self.imageToastView != nil
    }

}

//MARK: -  成功的消息类型，展示在window上
extension HDToast {
    func show(msg: String?,success:Bool,inView:UIView? = nil,duration:Int?) {
        if self.imageToastView != nil {
            return
        }
        
        // 下面有个参数30=图片宽度+间距，如果在xib中重新设置的宽度和间距就要在这做相应的修改
        // 计算文本的最大宽度为父控件的宽度-2边的间距-文本的内部间距-图片宽度（图片宽20）
        let sizeMsg = (msg! as NSString).boundingRect(with: CGSize(width:(inView ?? self.window!).hd_width-2*marginH-2*insideMaginH-30,height:CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: textFont)], context: nil).size

        self.imageToastView = ImageToast.show()
        self.imageToastView?.backgroundColor = UIColor(white: 0, alpha: 0.8)
        self.imageToastView?.contentLabel.font = UIFont.systemFont(ofSize: textFont)
        self.imageToastView?.layer.cornerRadius = 5
        self.imageToastView?.layer.masksToBounds = true

        // 文本的最大宽度是父控件宽度-图片宽度-各种间距
        self.imageToastView?.contentLabel.preferredMaxLayoutWidth = (inView ?? self.window!).hd_width-2*marginH-2*insideMaginH-30
        self.imageToastView?.contentLabel.text = msg
        if success {
            self.imageToastView?.iconView.image = UIImage(named: "ic_toast_success")
        } else {
            self.imageToastView?.iconView.image = UIImage(named: "icon_sign")
        }
        
        // 文本框位置设置
        self.imageToastView?.hd_width = sizeMsg.width+30+2*insideMaginH
        if (self.imageToastView?.hd_width)! < minLabelWidth {
            self.imageToastView?.hd_width = (inView ?? self.window!).hd_width*0.6
        }
        self.imageToastView?.hd_height = sizeMsg.height + 2*marginV
        self.imageToastView?.hd_x = 0.5*((inView ?? self.window!).hd_width-(self.imageToastView?.hd_width)!)
        self.imageToastView?.hd_y = 0.5*((inView ?? self.window!).hd_height-(self.imageToastView?.hd_height)!)
        
        (inView ?? self.window!).addSubview(self.imageToastView!)
        
        let shakeAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        shakeAnimation.duration = 0.25
        shakeAnimation.fromValue = animationFromValue
        shakeAnimation.toValue = 1
        shakeAnimation.autoreverses = true
        self.imageToastView?.layer.add(shakeAnimation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(Double(duration ?? self.defultSecond) * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            self.imageToastView?.removeFromSuperview()
            self.imageToastView = nil
        }
    }
}

//MARK: -  展示纯文字
extension HDToast {
    func show(msg:String?, inView:UIView? = nil, duration:Int?) {
        
        // 防止用户重复点击，重复出现
        if self.textToastView != nil {
            return
        }
        
        // 计算文本的最大宽度为父控件的宽度-2边的间距-文本的内部间距
        let sizeMsg = (msg! as NSString).boundingRect(with: CGSize(width:((inView ?? self.window!).hd_width)-2*self.marginH-2*insideMaginH,height:CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: textFont)], context: nil).size
        
        self.textToastView = TextToast.show()
        self.textToastView?.backgroundColor = UIColor(white: 0, alpha: 0.8)
        self.textToastView?.contentLable.font = UIFont.systemFont(ofSize: textFont)
        self.textToastView?.layer.cornerRadius = 5
        self.textToastView?.layer.masksToBounds = true
        
        // 文本的最大宽度是父控件宽度-图片宽度-各种间距
        self.textToastView?.contentLable.preferredMaxLayoutWidth = (inView ?? self.window!).hd_width-2*self.marginH-2*insideMaginH
        self.textToastView?.contentLable.text = msg

        // 文本框位置设置
        self.textToastView?.hd_width = sizeMsg.width+2*insideMaginH
        if (self.textToastView?.hd_width)! < minLabelWidth {
            self.textToastView?.hd_width = (inView ?? self.window!).hd_width*0.6
        }
        self.textToastView?.hd_height = sizeMsg.height+2*marginV
        self.textToastView?.hd_x = 0.5*((inView ?? self.window!).hd_width-(self.textToastView?.hd_width)!)
        self.textToastView?.hd_y = 0.5*((inView ?? self.window!).hd_height-(self.textToastView?.hd_height)!)
        (inView ?? self.window!).addSubview(textToastView!)
        
        let shakeAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        shakeAnimation.duration = 0.25
        shakeAnimation.fromValue = animationFromValue
        shakeAnimation.toValue = 1
        shakeAnimation.autoreverses = true
        self.textToastView?.layer.add(shakeAnimation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(Double(duration ?? self.defultSecond) * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            self.textToastView?.removeFromSuperview()
            self.textToastView = nil
        }
    }
}

