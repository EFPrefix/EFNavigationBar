//
//  ImageNavController .swift
//  EFNavigationBar
//
//  Created by wangrui on 2017/4/19.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit

private let IMAGE_HEIGHT: CGFloat = 220
@MainActor private let NAVBAR_COLORCHANGE_POINT: CGFloat = IMAGE_HEIGHT - CGFloat(kNavBarHeight * 2)

class ImageNavController: BaseViewController {
    lazy var tableView: UITableView = {
        let table: UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.view.bounds.height), style: .plain)
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    lazy var topView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "image7"))
        imgView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: IMAGE_HEIGHT)
        imgView.contentMode = UIView.ContentMode.scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "玛丽莲·梦露"
        view.backgroundColor = UIColor.red
        view.addSubview(tableView)
        tableView.tableHeaderView = topView
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } 
        view.insertSubview(navBar, aboveSubview: tableView)
        
        // 设置导航栏显示图片
        navBar.barBackgroundImage = UIImage(named: "imageNav")
        
        // 设置初始导航栏透明度
        navBar.setBackgroundAlpha(alpha: 0)
        
        // 设置导航栏按钮和标题颜色
        navBar.setTintColor(color: .white)
        
        // 设置状态栏style
        //statusBarStyle = .lightContent

    }
    
    deinit {
        print("FirstVC deinit")
    }
}

// MARK: - 滑动改变导航栏透明度、标题颜色、左右按钮颜色、状态栏颜色
extension ImageNavController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if (offsetY > NAVBAR_COLORCHANGE_POINT) {
            let alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / CGFloat(kNavBarHeight)
            navBar.setBackgroundAlpha(alpha: alpha)
        } else {
            navBar.setBackgroundAlpha(alpha: 0)
        }
    }
}

extension ImageNavController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let str = String(format: "EFNavigationBar %zd", indexPath.row)
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:BaseViewController = BaseViewController()
        vc.view.backgroundColor = UIColor.red
        let str = String(format: "右滑返回查看效果 ", indexPath.row)
        vc.navBar.title = str
        navigationController?.pushViewController(vc, animated: true)
    }
}
