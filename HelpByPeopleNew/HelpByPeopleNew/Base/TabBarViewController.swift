//
//  TabBarViewController.swift
//  HelpByPeopleNew
//
//  Created by Alexey Grebennikov on 12.01.22.
//

import UIKit

class TabBarViewController: UITabBarController, Routable {
    
    init(router: MainRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    
    var router: MainRouter?
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarMenuControllers()
        addTabBar()
    }
    
    // MARK: - Private Utils
    
    private func setupTabBarMenuControllers() {
        
        let mapVC = MapViewController()
        mapVC.router = router
        let mapItem = UINavigationController(rootViewController: mapVC)
        mapItem.tabBarItem.image = UIImage(named: "map")
        mapItem.title = "Map"
        mapItem.tabBarItem.tag = 0
        
        let profileVC = ProfileViewController()
        profileVC.router = router
        let profileItem = UINavigationController(rootViewController: profileVC)
        profileItem.tabBarItem.image = UIImage(named: "person")
        profileItem.title = "Profile"
        profileItem.tabBarItem.tag = 1
    }
    
    private func addTabBar() {
        self.delegate = self
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .systemBackground //.white
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .gray
  
        
    }


}

//MARK: - UITabBarControllerDelegate
extension TabBarViewController: UITabBarControllerDelegate {
    
}

