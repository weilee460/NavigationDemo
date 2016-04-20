# NavigationDemo
首页添加navigationController，代码生成view
原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_586.html

Swift - 使用导航条和导航条控制器来进行页面切换

通过使用导航条（UINavigationBar）与导航条控制器（UINavigationController）可以方便的在主页面和多层子页面之间切换。下面通过一个简单“组件效果演示”的小例子来说明如何通过代码来进行页面的切换。

功能如下：
1，在AppDelagete.swift入口文件中把首页ViewController做了导航控件的封装
2，首页是一个表格列出几个Swift控件的名称
3，点击表格项即切换到对应组件展示页面，顶部的导航条标题变为该控件的名称，同时导航条左侧还有返回按钮
4，在展示页中，给导航条右侧添加了“效果/代码”切换的按钮，点击分别展示组件的效果和代码

