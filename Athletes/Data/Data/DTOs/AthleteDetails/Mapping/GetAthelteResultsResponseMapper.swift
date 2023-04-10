//
//  GetAthelteResultsResponseMapper.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation

extension AthleteResultModelDto {
    func mapToModel() -> AthleteResultModel {
        AthleteResultModel(
            city: city,
            year: year,
            gold: gold,
            silver: silver,
            bronze: bronze
        )
    }
}
