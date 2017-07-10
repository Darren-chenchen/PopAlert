//
//  SuccessToast.swift
//  testPop
//
//  Created by darren on 2017/7/5.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class ImageToast: UIView {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    static func show() -> ImageToast {
        return Bundle.main.loadNibNamed("ImageToast", owner: nil, options: nil)?.last as! ImageToast
    }
}
