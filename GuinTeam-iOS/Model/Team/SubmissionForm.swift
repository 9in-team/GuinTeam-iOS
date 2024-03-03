//
//  SubmissionForm.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

import Foundation

struct SubmissionForm: Hashable, Codable {
    
    var number: Int?
    var type: SubmissionFormType
    var question: String = ""
    var options: [String]?
    
}

enum SubmissionFormType: Int, Codable, CaseIterable {
    
    case text = 0
    case image = 1
    case file = 2
    case checkBox = 3
    
    private enum CodingKeys: String, CodingKey {
        case test = "TEXT"
        case image = "IMAGE"
        case file = "FILE"
        case checkBox = "CHECKBOX"
    }
    
    func asset() -> String {
        switch self {
        case .text:
            return "Text"
        case .image:
            return "Image"
        case .file:
            return "File"
        case .checkBox:
            return "Choice"
        }
    }
    
    func assetSize() -> CGSize {
        switch self {
        case .text:
            return CGSize(width: 19, height: 15)
        case .image:
            return CGSize(width: 18, height: 18)
        case .file:
            return CGSize(width: 16, height: 20)
        case .checkBox:
            return CGSize(width: 18, height: 18)
        }
    }
    
    func text() -> String {
        switch self {
        case .text:
            return "텍스트"
        case .image:
            return "이미지"
        case .file:
            return "파일"
        case .checkBox:
            return "체크박스"
        }
    }
    
}
