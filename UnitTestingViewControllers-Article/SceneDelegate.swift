//
//  SceneDelegate.swift
//  UnitTestingViewControllers-Article
//
//  Created by Vadym Bulavin on 11/8/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let artistVC = storyboard.instantiateViewController(identifier: "ArtistDetailViewController") as! ArtistDetailViewController
        
        let presenter = ArtistDetailPresenterImpl()
        presenter.viewController = artistVC
        artistVC.presenter = presenter
        
        let window = UIWindow(windowScene: scene as! UIWindowScene)
        window.rootViewController = UINavigationController(rootViewController: artistVC)
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

