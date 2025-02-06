//
//  BaseViewController.swift
//  UnsplashApp
//
//  Created by Paul Matar on 06.02.2025.
//

import UIKit
import Combine

class BaseViewController<View: UIView>: UIViewController {
    // MARK: - Properties
    lazy var customView = View(frame: UIScreen.main.bounds)
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    init() {
      super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable,
                message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable,
                message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )

    required init?(coder aDecoder: NSCoder) {
      fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    override func loadView() {
        self.view = customView
    }
}
