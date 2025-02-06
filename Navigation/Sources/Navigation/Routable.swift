//
//  Routable.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

public protocol Routable: AnyObject {
    func setRoot(_ module: any Presentable)
    func setRoot(_ module: any Presentable, animated: Bool)
    func setRoot(_ module: any Presentable, animated: Bool, hideNavigationBar: Bool)
    
    func push(_ module: any Presentable, onBack: (() -> Void)?)
    func push(_ module: any Presentable, animated: Bool, onBack: (() -> Void)?)
    func push(_ module: any Presentable, animated: Bool, hideBottomBar: Bool, onBack: (() -> Void)?)
    
    func pop()
    func pop(animated: Bool)
    
    func popToRoot()
    func popToRoot(animated: Bool)
    
    func pop(to module: Presentable)
    func pop(to module: Presentable, animated: Bool)
    
    func present(_ module: any Presentable)
    func present(_ module: any Presentable, animated: Bool)
    func present(
        _ module: any Presentable,
        animated: Bool,
        presentationStyle: UIModalPresentationStyle?,
        transitionStyle: UIModalTransitionStyle?,
        completion: (() -> Void)?
    )
    
    func dismiss()
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    
    func openURL(_ url: URL)
}
