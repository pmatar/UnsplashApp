//
//  Router.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit

public final class Router: NSObject {
    private let navigationController: UINavigationController
    private var closures: [AnyHashable: () -> Void] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
}

// MARK: - Router
extension Router: Routable {
    public func setRoot(_ module: any Presentable) {
        setRoot(module, animated: true, hideNavigationBar: false)
    }
    
    public func setRoot(_ module: any Presentable, animated: Bool) {
        setRoot(module, animated: animated, hideNavigationBar: false)
    }
    
    public func setRoot(_ module: Presentable, animated: Bool, hideNavigationBar: Bool) {
        closures.forEach { $0.value() }
        let viewController = module.toPresentable()
        navigationController.setViewControllers([viewController], animated: animated)
        navigationController.isNavigationBarHidden = hideNavigationBar
    }
    
    public func push(_ module: any Presentable, onBack: (() -> Void)?) {
        push(module, animated: true, hideBottomBar: false, onBack: onBack)
    }
    
    public func push(_ module: any Presentable, animated: Bool, onBack: (() -> Void)?) {
        push(module, animated: animated, hideBottomBar: false, onBack: onBack)
    }
    
    public func push(
        _ module: any Presentable,
        animated: Bool,
        hideBottomBar: Bool,
        onBack closure: (() -> Void)?
    ) {
        let viewController = module.toPresentable()
        guard !(viewController is UINavigationController) else { return }
        
        if let closure {
            closures.updateValue(closure, forKey: ObjectIdentifier(viewController))
        }
        navigationController.hidesBottomBarWhenPushed = hideBottomBar
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func pop() {
        pop(animated: true)
    }
    
    public func pop(animated: Bool) {
        guard let viewController = navigationController.popViewController(animated: animated) else {
            return
        }
        executeClosure(viewController)
    }
    
    public func popToRoot() {
        popToRoot(animated: true)
    }
    
    public func popToRoot(animated: Bool) {
        guard let viewControllers = navigationController.popToRootViewController(animated: animated) else {
            return
        }
        
        viewControllers.forEach { executeClosure($0) }
    }
    
    public func pop(to module: Presentable) {
        pop(to: module, animated: true)
    }
    
    public func pop(to module: Presentable, animated: Bool) {
        guard let viewControllers = navigationController.popToViewController(
            module.toPresentable(),
            animated: animated
        ) else {
            return
        }
        viewControllers.forEach { executeClosure($0) }
    }
    
    public func present(_ module: any Presentable) {
        present(module, animated: true)
    }
    
    public func present(_ module: any Presentable, animated: Bool) {
        present(
            module,
            animated: animated,
            presentationStyle: nil,
            transitionStyle: nil,
            completion: nil
        )
    }
    
    public func present(
        _ module: any Presentable,
        animated: Bool,
        presentationStyle: UIModalPresentationStyle?,
        transitionStyle: UIModalTransitionStyle?,
        completion: (() -> Void)?
    ) {
        let viewController = module.toPresentable()
        if let presentationStyle {
            viewController.modalPresentationStyle = presentationStyle
        }
        if let transitionStyle {
            viewController.modalTransitionStyle = transitionStyle
        }
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss() {
        dismiss(animated: true)
    }
    
    public func dismiss(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
    
    public func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    public func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }
}

// MARK: - UINavigationControllerDelegate
extension Router: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(previousController) else {
            return
        }
        executeClosure(previousController)
    }
}

// MARK: - Private methods
extension Router {
    private func executeClosure(_ viewController: UIViewController) {
        if let closure = closures.removeValue(forKey: ObjectIdentifier(viewController)) {
            closure()
        }
    }
}

