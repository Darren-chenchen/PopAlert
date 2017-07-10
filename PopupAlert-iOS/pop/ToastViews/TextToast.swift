//
//  TextToast.swift
//  testPop
//
//  Created by darren on 2017/7/5.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class TextToast: UIView {

    @IBOutlet weak var contentLable: UILabel!
    
    static func show() -> TextToast {
        return Bundle.main.loadNibNamed("TextToast", owner: nil, options: nil)?.last as! TextToast
    }

}
