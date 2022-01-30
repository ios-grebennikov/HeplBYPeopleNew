//
//  MainRouter.swift
//  HelpByPeopleNew
//
//  Created by Alexey Grebennikov on 10.01.22.
//

import UIKit

protocol Routable: UIViewController {
    var router: MainRouter? { get set }
}

class MainRouter: NSObject {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController = navigationController
    }
    
    func pushAuthVC() {
        let authVC = AuthViewController()
        authVC.router = self
        pushViewController(vc: authVC)
    }

    func pushRegisterVC() {
        let registerVC = RegisterViewController()
        registerVC.router = self
        pushViewController(vc: registerVC)
    }
    
    func showTabBar() {
        pushViewController(vc: TabBarViewController(router: self))
    }
    
 
    func back() {
        navigationController.popViewController(animated: true)
    }

    
    //MARK: - Private Utils
    
    private func pushViewController(vc: Routable) {
        vc.router = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func presentViewController(vc: Routable, animated: Bool) {
        vc.router = self
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: true)
    }

}
