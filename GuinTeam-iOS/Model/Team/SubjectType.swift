//
//  SubjectType.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

enum SubjectType: Int, Codable, CaseIterable {
    
    case project = 0
    case study = 1
    
    var title: String {
        switch self {
        case .project:
            return "프로젝트"
        case .study:
            return "스터디"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case project = "PROJECT"
        case study = "STUDY"
    }
    
}
