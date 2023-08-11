//
//  SceneDelegate.swift
//  App-AnaWill
//
//  Created by user on 27/07/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
   
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        let navigationController = UINavigationController(rootViewController: HeroViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

