# 效果图
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705150716222-49540099.gif)

# 使用方式
#### 1.展示标题、内容、左右按钮
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705151806190-710411607.png)

		PopViewUtil.alert(title: "提水", message: "服务失败失败", leftTitle: "取消", rightTitle: "确定", leftHandler: {
                print("左")
       	}, rightHandler: { 
                print("右")
          })
          
#### 2.展示内容，左右按钮
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705151818347-366510318.png)

		PopViewUtil.alert(message: "服务器登服务器登服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败服务器登录失败录失败录失败录失败", leftTitle: "取消", rightTitle: "确定", leftHandler: {
                print("左")
            }, rightHandler: {
                print("右")
            })
            
#### 3.展示一个按钮
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705151827940-1993197151.png)
方式1

		PopViewUtil.alert(message: "测试左边按钮置为空", leftTitle: "", rightTitle: "确定", leftHandler: {
                print("左")
            }, rightHandler: {
                print("右")
            })
            
方式2

		PopViewUtil.alert(message: "测试右边按钮置为空", leftTitle: "确定", rightTitle: "", leftHandler: {
                print("左")
            }, rightHandler: {
                print("右")
            })


#### 4.展示纯文本提示框(toast)
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705151844784-1921693442.png)

		// 默认展示在window上，默认2秒消失
		PopViewUtil.showMessage(msg: "展示纯文本，在window上默认2s")
	   // 展示在指定view上默认2秒
	   PopViewUtil.showMessage(msg: "", onView: self.view)
    	// 以上2个方法应该是足够满足项目需求了，下面这个方法比较长，主要是把所有的扩展都放在里面了，对于特定的需求可以用下面的方法展示，
		PopViewUtil.showMessage(msg: "展示纯文本，在指定view上。指定3s", success: nil, inView: self.view, duration: 13)

#### 5.带有图片的提示框
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705151857300-1222661027.png)

		PopViewUtil.showMessage(msg: "展示有图片的成功消息，默认在window上，默认2s", success: true, inView: nil, duration: nil)
	            
		PopViewUtil.showMessage(msg: "展示有图片的失败消息，在指定view上，指定3s", success: false, inView: self.view, duration: 3)


# 对于控件的详细描述
##### 1.对于alert弹框：
缺点：该弹框控件适用于全局的设置弹框的需求，比如：如果UI需求是多样化的，即有的界面左边按钮的颜色是黑色，右边是红色，有的页面左边是绿色右边是蓝色，那么就需要对方法进行扩展，把color传递进去。

优势：如果样式是全局的，那么到指定的xib文件中去修改样式就好了，不需要关心过多的布局

修改alert的宽度：

		// 宽度的设置要在layoutIfNeeded方法之前 
		self.nomalView.hd_width = 100
		// 赋值后注意重新布局一下，不然如果xib中lable没有设置文字，view的尺寸会不对
		self.nomalView.layoutIfNeeded()

#### 2.对于toast
2-1、toast支持展示在任意的view上，默认展示在window上，默认显示时间2s，由于展示在window上时界面切换了，提示信息还存在，所以就将toast扩展到可以放在指定view上。

2-2、toast的结构
![logo](http://images2015.cnblogs.com/blog/818253/201707/818253-20170705174426519-1653100577.png)

可以在HDToast文件中修改字体大小、文本框的最小宽度、默认时长、禁止动画、文本框内间距等。

2-3、关于toast的动画：如果禁止动画效果直接将        self.textToastView?.layer.add(shakeAnimation, forKey: nil)
注释掉，如果需要再某一个页面禁止动画可设置            HDToast.share.animationFromValue = 1
但是要注意一点，由于是单例，所以如果想在某一个界面禁止动画其余界面还要打开动画，就需要再合适的地方设置其为0.8，不然其他地方的动画也会消失。

2-4、关于toast的位置注意点：如果toast位置靠近屏幕底部在一些特殊的地方，比如多个文本框（注册）时容易出现键盘遮挡toast的情况，这时可以在适当的时候让键盘退出
       
       DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1, execute: {
                    self.view.endEditing(true)
                })