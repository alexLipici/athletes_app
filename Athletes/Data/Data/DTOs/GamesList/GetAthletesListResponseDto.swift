//
//  GetAthletesListResponseDto.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation

struct AthleteResponseDto: Codable {
    let athleteId: String
    let name, surname: String
    let bio: String
    let dateOfBirth: String
    let weight, height: Int
    let photoId: Int
    
    enum CodingKeys: String, CodingKey {
        case athleteId = "athlete_id"
        case name, surname, bio, dateOfBirth, weight, height
        case photoId = "photo_id"
    }
}

typealias GetAthletesListResponseDto = [AthleteResponseDto]
