//
//  RecruitmentRole.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

struct RecruitmentRole: Codable, Hashable {
    
    var title: String
    var count: Int

    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case count = "requiredCount"
    }
}
