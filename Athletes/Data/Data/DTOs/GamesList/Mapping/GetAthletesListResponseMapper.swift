//
//  GetAthletesListResponseMapper.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import Foundation

extension AthleteResponseDto {
    func mapToModel() -> AthleteModel {
        AthleteModel(
            athleteId: athleteId,
            name: name,
            surname: surname,
            bio: bio,
            dateOfBirth: dateOfBirth,
            weight: weight,
            height: height,
            photoId: photoId
        )
    }
}
