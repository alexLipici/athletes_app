//
//  AthleteDetailsViewModel.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation
import Resolver
import RxSwift

class AthleteDetailsViewModel {
    struct Outputs {
        var fetchedMedals = PublishSubject<[AthleteResultModel]>()
    }
    
    @Injected private var getAthleteResultsUseCase: GetAthelteResultsUseCaseProtocol
    @Published var isLoading: Bool = false
    
    lazy var outputs = Outputs()
    
    private let athlete: AthleteModel
    
    var title: String {
        String(format: "%@ %@ details", athlete.name, athlete.surname)
    }
    
    init(athlete: AthleteModel) {
        self.athlete = athlete
    }
    
    func loadData() {
        guard let athleteId = Int(athlete.athleteId) else { return }
        
        isLoading = true
        
        getAthleteResultsUseCase.getAthleteResults(athleteId: athleteId) { [weak self] result in
            switch result {
            case .success(let list):
                let results = list.filter({ $0.getGlobalScore() > 0 })
                if !results.isEmpty {
                    self?.outputs.fetchedMedals.onNext(results)
                }
            case .failure(let failure):
                print(failure)
            }
            
            self?.isLoading = false
        }
    }
    
    func getAthelteInfo() -> (name: String, birthday: String, weight: String, height: String, photoUrl: URL?) {
        let fullName = String(format: "%@ %@", athlete.name, athlete.surname)
        let weight = String(format: "%i kg", athlete.weight)
        let height = String(format: "%i cm", athlete.height)
        let photoUrl = URL(string: AthletesRouter.photoById(athlete.photoId).fullUrl)
        return (fullName, athlete.dateOfBirth, weight, height, photoUrl)
    }
    
    func getBioText() -> String {
        athlete.bio
    }
}
