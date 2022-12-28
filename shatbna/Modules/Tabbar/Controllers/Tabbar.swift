//
//  Tabbar.swift
//  shatbna
//
//  Created by ahmed elshobary on 27/12/2022.
//

import UIKit
class GradientTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLayer()
        
        /**
         
         Tabbar tabs initialization
        */
        
        let tabBarItem1 = tabBar.items?[0]
        tabBarItem1?.title = NSLocalizedString("الرئيسية", comment: "")
        tabBarItem1?.image = UIImage(named: "Home")
        tabBarItem1?.selectedImage = UIImage(named: "home-selected")
        tabBarItem1?.tag = 0
       // tabBarItem1?.titlePositionAdjustment =  UIOffset(horizontal: 0, vertical: 0)
        tabBarItem1?.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        
        let tabBarItem2 = tabBar.items?[1]
        tabBarItem2?.title = "اللقطة"
        
        tabBarItem2?.image = UIImage(named: "dice")
        tabBarItem2?.selectedImage = UIImage(named: "dice-selected")
        tabBarItem2?.tag = 1
        tabBarItem2?.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        
        let tabBarItem3 = tabBar.items?[2]
        tabBarItem3?.title = NSLocalizedString("المشاريع", comment: "")
        tabBarItem3?.image = UIImage(named: "projects")
        tabBarItem3?.selectedImage = UIImage(named: "projects-selected")
        tabBarItem3?.tag = 2
        
        tabBarItem3?.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        let tabBarItem4 = tabBar.items?[3]
        tabBarItem4?.title = "رفع المقاسات"
        tabBarItem4?.image = UIImage(named: "rasm")
        tabBarItem4?.selectedImage = UIImage(named: "rasm-selected")
        tabBarItem4?.tag = 3
        tabBarItem4?.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        let tabBarItem = tabBar.items?[4]
        
        tabBarItem?.title = "مستشار شطبنا"
        tabBarItem?.image = UIImage(named: "expert")
        tabBarItem?.selectedImage = UIImage(named: "expert-selected")
        tabBarItem?.tag = 4
        tabBarItem?.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        let selectedColor   = UIColor.yellow
        let unselectedColor = UIColor.white
        self.tabBar.unselectedItemTintColor = unselectedColor
        self.tabBar.tintColor = UIColor.yellow
       
        
        /**
         Tabbar set appearance
        */
        
        UITabBar.appearance().backgroundColor = UIColor.clear
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor:unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor:selectedColor], for: .selected)
        
        
        
    }
    
    func addLayer() {
        let layer = CAShapeLayer()
             layer.path = UIBezierPath(roundedRect: CGRect(x: 5, y: self.tabBar.bounds.minY + 5, width: self.tabBar.bounds.width - 10, height: self.tabBar.bounds.height + 10), cornerRadius: 10).cgPath
             layer.shadowColor = UIColor.lightGray.cgColor
             layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
             layer.shadowRadius = 2
             layer.shadowOpacity = 0.3
             layer.borderWidth = 1.0
             layer.opacity = 1.0
             layer.isHidden = false
             layer.masksToBounds = false
             layer.fillColor = UIColor.black.cgColor
       
             self.tabBar.layer.insertSublayer(layer, at: 0)
    }
}
    
    
