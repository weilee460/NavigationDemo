//
//  DetailViewController.swift
//  NavigationDemo
//
//  Created by ying on 16/4/19.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置背景色
        view.backgroundColor = UIColor.darkGrayColor()
        //
        loadControl(self.title!)
        //
        let btn = UIBarButtonItem(title: "代码", style: .Plain, target: self, action: "btnCodeClicked:")
        navigationItem.rightBarButtonItem = btn
    }
    
    func loadControl(ctrl: String)  {
        switch (ctrl) {
        case "UILabel":
            let label = UILabel(frame: self.view.bounds)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont.systemFontOfSize(36)
            label.text = "Hello, Fengzi"
            view.addSubview(label)
        case "UIButton":
            let button = UIButton(frame: CGRectMake(110, 120, 100, 60))
            button.backgroundColor = UIColor.blueColor()
            button.setTitleColor(UIColor.yellowColor(), forState: .Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
            button.setTitle("Click on ME", forState: .Normal)
            //为按钮添加点击事件
            button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
            view.addSubview(button)
    
        case "UIImageView":
            let image = UIImage(named: "swift.png")
            let imageView = UIImageView(frame: CGRectMake((CGRectGetWidth(self.view.bounds) - image!.size.width) / 2.0, 120.0, (image?.size.width)!,(image?.size.height)!))
            imageView.image = image
            view.addSubview(imageView)
        case "UISlider":
            let slider = UISlider(frame: CGRectMake(60.0, 120.0, 200.0, 30.0))
            view.addSubview(slider)
            
        case "UIWebView":
            let webView = UIWebView(frame: self.view.bounds)
            let url = NSURL(string: "http://cn.bing.com")
            let request = NSURLRequest(URL: url!)
            webView.loadRequest(request)
            view.addSubview(webView)
            
        default:
            print("control name: \(ctrl)")
        }
    }
    
    //
    func loadCode(ctrl: String)
    {
        var str: String
        switch ctrl {
        case "UILabel":
            str = "let label = UILabel(frame: self.view.bounds)\n"
            str += "label.backgroundColor = UIColor.clearColor()\n"
            str += "label.textAlignment = NSTextAlignment.Center\n"
            str += "label.font = UIFont.systemFontOfSize(36)\n"
            str += "label.text = \"Hello, Ucai\"\n"
            str += "self.view.addSubview(label)"
            
        case "UIButton":
            str = "UIButton"
            
        case "UISlider":
            str = "let slider = UISlider(frame:CGRectMake(60.0, 120.0, 200.0, 30.0))\n"
            str += "self.view.addSubview(slider)"
            
        default:
            str = "other ctrl"
        }
        
        //在导航条下方位置显示源代码
        let txt = UITextView(frame: CGRectMake(0, 60, view.bounds.size.width, view.bounds.size.height - 60))
        txt.text = str
        view.addSubview(txt)
    }
    
    //
    func clearViews()  {
        for v in view.subviews as [UIView]
        {
            v.removeFromSuperview()
        }
    }
    
    func buttonClicked(sender: UIButton) {
        print("you clicked button")
    }
    
    //显示控件的代码
    func btnCodeClicked(sender: UIButton) {
        print("title: \(self.title!)")
        clearViews()
        if navigationItem.rightBarButtonItem?.title == "代码"
        {
            loadCode(title!)
            navigationItem.rightBarButtonItem?.title = "效果"
        }
        else {
            navigationItem.rightBarButtonItem?.title = "代码"
            loadControl(title!)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
