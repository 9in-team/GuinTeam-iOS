//
//  HomeViewModel.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 1/22/24.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel: BaseViewModel, InputOutputProtocol {
    
    struct Input {
        let getTeamListAction: Observable<Void>
    }
    
    struct Output {
        let updateResultPublisher: Observable<[Team]>
    }
    
    func transform(input: Input) -> Output {
        let updateResultPublisher = input.getTeamListAction.flatMapLatest { [weak self] in
            return self?.requestTeamList() ?? Observable.empty()
        }
        
        return Output(updateResultPublisher: updateResultPublisher)
    }
    
    private func requestTeamList() -> Observable<[Team]> {         
        return Observable<[Team]>.just([
            Team(teamId: 0,
                 subject: "알고리즘 스터디원 구합니다.",
                 openChatUrl: "",
                 templates: [],
                 hashtags: [HashTag("#알고리즘"), HashTag("#면접"), HashTag("#멘토"), HashTag("#멘티"), HashTag("#CS")],
                 type: .study,
                 requiredRoles: []),
            Team(teamId: 1,
                 subject: "프로젝트 팀원 구합니다.",
                 openChatUrl: "",
                 templates: [],
                 hashtags: [HashTag("#알고리즘"), HashTag("#면접")],
                 type: .project,
                 requiredRoles: [])
        ])
        .delay(.seconds(2), scheduler: MainScheduler.instance)
    }
    
}
