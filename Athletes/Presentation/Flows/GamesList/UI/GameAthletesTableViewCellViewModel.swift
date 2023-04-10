//
//  GameAthletesTableViewCellViewModel.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation

protocol GameAthletesTableViewCellViewModelDelegate: AnyObject {
    func didSelectItem(athlete: AthleteModel)
}

class GameAthletesTableViewCellViewModel {
    private let athletes: [AthleteModel]
    let title: String
    
    weak var delegate: GameAthletesTableViewCellViewModelDelegate?
    
    init(game: GameModel, athletes: [AthleteModel]) {
        self.athletes = athletes
        self.title = String(format: "%@ %i", game.city, game.year)
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        athletes.count
    }
    
    func item(at indexPath: IndexPath) -> AthleteModel? {
        guard indexPath.row < athletes.count else { return nil }
        
        return athletes[indexPath.row]
    }
    
    func athleteName(at indexPath: IndexPath) -> String {
        guard let athlete = item(at: indexPath) else { return "-" }
        
        return String(format: "%@ %@", athlete.name, athlete.surname)
    }
    
    func athleteAvatarUrl(at indexPath: IndexPath) -> String? {
        guard let athlete = item(at: indexPath) else { return nil }
        
        let photoId = athlete.photoId
        
        return AthletesRouter.photoById(photoId).fullUrl
    }
    
    func didSelectItemAt(_ indexPath: IndexPath) {
        guard let athlete = item(at: indexPath) else { return }
        
        delegate?.didSelectItem(athlete: athlete)
    }
}
