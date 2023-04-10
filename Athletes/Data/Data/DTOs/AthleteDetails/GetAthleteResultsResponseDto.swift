//
//  GetAthleteResultsResponseDto.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import Foundation

struct AthleteResultModelDto: Codable {
    let city: String
    let year: Int
    let gold, silver, bronze: Int
}

typealias GetAthleteResultsResponseDto = [AthleteResultModelDto]
