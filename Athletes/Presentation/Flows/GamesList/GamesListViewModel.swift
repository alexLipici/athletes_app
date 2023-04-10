//
//  GamesListViewModel.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation
import Resolver
import RxSwift

class GamesListViewModel {
    enum ScreenState {
        case idle
        case loading
        case list
        case empty
        case error(String)
    }
    
    struct Outputs {
        var showDetails = PublishSubject<AthleteModel>()
    }
    
    @Injected private var getAthletesUseCase: GetAthletesByGamesUseCaseProtocol
    @Published var screenState: ScreenState = .idle
    
    private var dataSource = [GameModel : [AthleteModel]]()
    private var orderedKeys = [GameModel]()
    
    lazy var outputs = Outputs()
    
    func loadData() {
        screenState = .loading
        
        getAthletesUseCase.getAthletesByGames(page: 0) { [weak self] result in
            switch result {
            case .success(let list):
                self?.dataSource = list
                self?.orderedKeys = list.keys.sorted(by: { $0.year > $1.year })
                
                if list.isEmpty {
                    self?.screenState = .empty
                } else {
                    self?.screenState = .list
                }
            case .failure(let failure):
                print(failure)
                self?.screenState = .error(failure.localizedDescription)
            }
        }
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        orderedKeys.count
    }
    
    func makeCellViewModel(at indexPath: IndexPath) -> GameAthletesTableViewCellViewModel? {
        guard let item = item(at: indexPath) else { return nil }
        
        let vm = GameAthletesTableViewCellViewModel(game: item.game, athletes: item.athletes)
        vm.delegate = self
        
        return vm
    }
    
    private func item(at indexPath: IndexPath) -> (game: GameModel, athletes: [AthleteModel])? {
        guard indexPath.row < orderedKeys.count else { return nil }
        
        let game = orderedKeys[indexPath.row]
        
        return (game, dataSource[game] ?? [])
    }
}

extension GamesListViewModel: GameAthletesTableViewCellViewModelDelegate {
    func didSelectItem(athlete: AthleteModel) {
        outputs.showDetails.onNext(athlete)
    }
}
