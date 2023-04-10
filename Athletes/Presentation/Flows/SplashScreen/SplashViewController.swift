//
//  SplashViewController.swift
//
//  Created by Petru-Alexandru Lipici on 07.11.2022.
//

import UIKit
import PKHUD

class SplashViewController: BaseViewController {
    
    private let viewModel: SplashViewModel
        
    private var _view: SplashView {
        return view as! SplashView
    }
    
    override func loadView() {
        view = SplashView(frame: .zero)
    }
    
    required init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.viewDidAppear()
    }
}
