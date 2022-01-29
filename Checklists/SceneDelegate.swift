//
//  SceneDelegate.swift
//  Checklists
//
//  Created by Katellyn Hyker on 1/21/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        saveData()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        saveData()
    }
    //MARK: -  Helper Methods
    func saveData() {
        let navigationController = window!.rootViewController as! UINavigationController
        let controller = navigationController.viewControllers[0] as! AllListsViewController
        controller.saveChecklists()
    }


}

