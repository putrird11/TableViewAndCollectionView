//
//  SceneDelegate.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 07/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let _ = (scene as? UIWindowScene) else { return }
    
    let controller = HomePage()
    let navigationController = UINavigationController(rootViewController: controller)
    //    navigationController.setNavigationBarHidden(true, animated: false)
    window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
  }
  
  
}

