//
//  ParentViewController.swift
//  practice_RxSwift_CloudFileStore
//
//  Created by 塩見陵介 on 2020/05/13.
//  Copyright © 2020 つまようじ職人. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    enum mode: Int{
        case add = 0,
        show
    }

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    
    // mode
    var modeTag: Int = mode.add.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first
        for i in 0..<tabBar.items!.count{
            tabBar.items![i].tag = i
        }
        
        let addVC = self.storyboard?.instantiateViewController(identifier: "AddTextViewController")
        
        // 貼り付け
        self.addChild(addVC!)
        container.addSubview(addVC!.view)
        addVC!.view.frame = container.bounds
        addVC!.didMove(toParent: self)
        
    }
    
    // 貼り付け作業
    func transitionControl(_ vc: UIViewController){
        
        // 全部剥がす
        for child in self.children{
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        // 貼る
        self.addChild(vc)
        container.addSubview(vc.view)
        vc.view.frame = container.bounds
        vc.didMove(toParent: self)
    }

}

extension ParentViewController: UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        print(item.tag)
        
        if(item.tag == modeTag){
            return
        }
        
        switch item.tag {
        case mode.add.rawValue:
            modeTag = mode.add.rawValue
            let VC = self.storyboard?.instantiateViewController(identifier: "AddTextViewController")
            transitionControl(VC!)
            break
        case mode.show.rawValue:
            modeTag = mode.show.rawValue
            let VC = self.storyboard?.instantiateViewController(identifier: "ShowTextViewController")
            transitionControl(VC!)
            break
        default:
            break
        }
    }
}
