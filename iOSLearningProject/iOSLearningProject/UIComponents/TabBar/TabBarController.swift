//
//  TabBarController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 06/03/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        print(self.viewControllers!)
        self.delegate = self
//        let vcHome = HomePageViewController()
//        let vcTasks = TaskPageViewController()
//        let vcCalls = CallsPageViewController()
//        self.setViewControllers([vcHome, vcCalls, vcTasks], animated: false)
//        print(self.viewControllers!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelectTab selectedTab: UITab, previousTab: UITab?) {
        print("selected diff tab")
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("new tab selected")
    }
}
