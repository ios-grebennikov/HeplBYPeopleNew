//
//  AppCoordinator.swift
//  HelpByPeopleNew
//
//  Created by Alexey Grebennikov on 10.01.22.
//

import UIKit

class AppCoordinator: NSObject {
    
    var window: UIWindow
    var router: MainRouter?
    
    init(window: UIWindow?) {
        self.window = window!
        super.init()
        
        startScreenFlow()
    }
    
    func didFinishLaunchingWithOptions(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {

    }
    
    private func startScreenFlow() {
        let navController = UINavigationController()
        router = MainRouter(navigationController: navController)
        
        //проверить
        router?.pushAuthVC()
//        router?.showTabBar()
    
        
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
        
    }
    
    
}
