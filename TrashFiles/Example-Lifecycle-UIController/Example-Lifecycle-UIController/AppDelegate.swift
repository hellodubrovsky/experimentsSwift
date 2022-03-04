//
//  AppDelegate.swift
//  Example-Lifecycle-UIController
//
//  Created by Илья on 26.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Окно, в котором может быть группа контроллеров. Все iOS приложения одноэкранные.
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Перечисление всех дочерних контроллеров.
        let greenViewController = GreenViewController()
        let whiteViewController = WhiteViewController()
        let grayViewController = GrayViewController()
        
        // Создание заголовков для контроллеров.
        // Заголовок будет только у view зеленого цвета, т.к. это она ниже будет отдельным контейнером.
        greenViewController.title = "Green!"
        whiteViewController.title = "White!"
        grayViewController.title = "Gray!"
        
        // Создание item'ов (вкладок tabBar'a) по экранам с разными цветами.
        let itemInTabBarGreen = UITabBarItem()
        let itemInTabBarWhite = UITabBarItem()
        let itemInTabBarGray = UITabBarItem()
        
        // Присвоение item'ам названия (title).
        itemInTabBarGreen.title = "GreenTitleItem"
        itemInTabBarWhite.title = "WhiteTitleItem"
        itemInTabBarGray.title = "GrayTitleItem"
        
        // Соеднияем item'ы с нужными viewController'ами.
        greenViewController.tabBarItem = itemInTabBarGreen
        whiteViewController.tabBarItem = itemInTabBarWhite
        grayViewController.tabBarItem = itemInTabBarGray
        
        // В коде ниже, мы делаем из greenViewController новый стек.
        // В таком случае, мы внутрь одного контейнера кладём другой.
        let greenNavigationController = UINavigationController(rootViewController: greenViewController)
        
        // Создание tabBar и добавление в него контроллеров с view разных цветов.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [greenNavigationController, whiteViewController, grayViewController]
        
        // Выбор основного view, который будет в tabBar по умолчанию.
        tabBarController.selectedViewController = grayViewController
        // Или можно через такое св-во: tabBarController.selectedIndex = 2
        
        // Делаем tabBar ключевым.
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
