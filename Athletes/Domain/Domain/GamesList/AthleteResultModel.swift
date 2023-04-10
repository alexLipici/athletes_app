//
//  AthleteResultModel.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation

struct AthleteResultModel {
    let city: String
    let year: Int
    let gold, silver, bronze: Int
    
    func getGlobalScore() -> Int {
        return gold * ResultScoreWeight.gold.rawValue +
        silver * ResultScoreWeight.silver.rawValue +
        bronze * ResultScoreWeight.bronze.rawValue
    }
}
