//
//  BaseTabBarController.swift
//  AppstoreJSON
//
//  Created by OuSS on 2/13/20.
//  Copyright © 2020 OuSS. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: UIViewController(), title: "Search", imageName: "search")
        ]
    }
    
    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return navController
    }
}
