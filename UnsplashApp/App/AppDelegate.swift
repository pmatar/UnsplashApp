//
//  AppDelegate.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit
import Inject
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerDependencies()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// MARK: - Private methods
extension AppDelegate {
    private func registerDependencies() {
        Container.shared.register(type: CoordinatorFactoryProtocol.self, implementer: CoordinatorFactory())
        Container.shared.register(type: ModuleFactoryProtocol.self, implementer: ModuleFactory())
        Container.shared.register(type: HTTPClient.self, implementer: AuthorizedHTTPClient())
        Container.shared.register(type: HTTPResponseMapper.self, implementer: StandardMapper(decoder: .standard))
        Container.shared.register(type: PhotosRepository.self, implementer: RemotePhotosRepository())
        Container.shared.register(type: ImageLoadable.self, implementer: ImageLoader())
    }
}
