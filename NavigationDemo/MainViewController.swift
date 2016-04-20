//
//  MainViewController.swift
//  NavigationDemo
//
//  Created by ying on 16/4/19.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //
    var tableView: UITableView?
    
    //
    var ctrls = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Swift控件演示"
        tableView = UITableView(frame: view.frame, style: UITableViewStyle.Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        view.addSubview(tableView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //DataSources
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ctrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwiftCell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = ctrls[indexPath.row]
        return cell
    }
    
    
    //delegate协议方法，点击时调用
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //跳转到detailViewController，取消选中状态
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //创建DetailViewController
        let detailViewController = DetailViewController()
        //传递控件的title，在detailView里用于判断生成响应的控件
        detailViewController.title = ctrls[indexPath.row]
        //navigationController跳转到detailViewController
        navigationController?.pushViewController(detailViewController, animated: true)
    }


}
