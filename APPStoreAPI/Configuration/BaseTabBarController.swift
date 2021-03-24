//
//  BaseTabBarController.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let firstVC = FirstTabViewController()
    let secondVC = SecondTabViewController()
    let thirdVC = ThirdTabViewController()
    let fourthVC = FourthTabViewController()
    let fifthVC = FifthTabViewController()

    let firstTabbarItem = UITabBarItem(title: "First", image: nil, tag: 0)
    let secondTabbarItem = UITabBarItem(title: "Second", image: nil, tag: 1)
    let thirdTabbarItem = UITabBarItem(title: "Third", image: nil, tag: 2)
    let fourthTabbarItem = UITabBarItem(title: "Fourth", image: nil, tag: 3)
    let fifthTabbarItem = UITabBarItem(title: "Fifth", image: nil, tag: 4)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNavigationController = UINavigationController(rootViewController: firstVC)
        let secondNavigationController = UINavigationController(rootViewController: secondVC)
        let thirdNavigationController = UINavigationController(rootViewController: thirdVC)
        let fourthNavigationController = UINavigationController(rootViewController: fourthVC)
        let fifthNavigationController = UINavigationController(rootViewController: fifthVC)

        firstNavigationController.tabBarItem = firstTabbarItem
        secondNavigationController.tabBarItem = secondTabbarItem
        thirdNavigationController.tabBarItem = thirdTabbarItem
        fourthNavigationController.tabBarItem = fourthTabbarItem
        fifthNavigationController.tabBarItem = fifthTabbarItem
        
        self.viewControllers = [firstNavigationController,
                                secondNavigationController,
                                thirdNavigationController,
                                fourthNavigationController,
                                fifthNavigationController]
        self.delegate = self
    }
    
}
