//
//  GamesListCoordinator.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import UIKit
import RxSwift

enum GamesListCoordinationResult: Equatable { }

class GamesListCoordinator: BaseCoordinator<GamesListCoordinationResult> {
    
    private let window: UIWindow!
    
    private var navigationController: UINavigationController!
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<CoordinateResultType<CoordinationResult>> {
        let viewModel = GamesListViewModel()
        let viewController = GamesListViewController(viewModel: viewModel)

        navigationController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        viewModel.outputs.showDetails
            .subscribe(onNext: { [weak self] in
                self?.showDetails(athlete: $0)
            })
            .disposed(by: disposeBag)
        
        return .never()
    }
    
    private func showDetails(athlete: AthleteModel) {
        print("pressend on:", athlete.name)
        let vm = AthleteDetailsViewModel(athlete: athlete)
        let vc = AthleteDetailsViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
