//
//  HashTag.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

struct HashTag: Codable, Hashable {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}
