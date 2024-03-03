//
//  TeamCollectionViewCell.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

import UIKit
import SnapKit

final class TeamCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
        .then {
            $0.font = .appFont(.robotoRegular, size: 16)
            $0.textColor = .appColor(.titleLabel)
            $0.numberOfLines = 2
        }
    
    private let teamTypeLabel = UILabel()
        .then {
            $0.font = .appFont(.robotoRegular, size: 13)
            $0.textColor = .appColor(.titleLabel)
            $0.textAlignment = .center
            $0.backgroundColor = UIColor(hex: "000000", alpha: 0.08)
        }
    
    private let tagView = TagView(tagHeight: 24)
    
    private let leaderLabel = UILabel()
        .then {
            $0.text = "조상현"
            $0.font = .appFont(.robotoRegular, size: 12)
            $0.textColor = .label
        }
    
    private let timeAgoLabel = UILabel()
        .then {
            $0.text = "1시간 전"
            $0.font = .appFont(.robotoRegular, size: 12)
            $0.textColor = UIColor(hex: "000000", alpha: 0.38)
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
      
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func setData(_ team: Team) {
        titleLabel.text = team.subject
        teamTypeLabel.text = team.type.title
        let size = team.type.title.size(withAttributes: [.font: (teamTypeLabel.font as UIFont)])
        teamTypeLabel.snp.makeConstraints {
            $0.width.equalTo(size.width + 20)
        }
        tagView.setTag(team.hashtags.map { $0.name })
        // etc
    }
    
    private func layout() {
        layoutShadow()
        
        addSubview(titleLabel)
        addSubview(teamTypeLabel)
        addSubview(tagView)
        addSubview(leaderLabel)
        addSubview(timeAgoLabel)
        
        layoutTitleLabel()
        layoutTeamTypeLabel()
        layoutTagView()
        layoutLeaderLabel()
        layoutTimeAgoLabel()
    }
    
    private func layoutShadow() {
        backgroundColor = .white
        
        shadow(alpha: 0.2,
               y: 3,
               blur: 3,
               spread: -2,
               radius: 4)
        
        shadow(alpha: 0.2,
               y: 3,
               blur: 4,
               spread: 0,
               radius: 4)
        
        shadow(alpha: 0.12,
               y: 1,
               blur: 8,
               spread: 0,
               radius: 4)
    }
    
    private func layoutTitleLabel() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(13)
            $0.width.equalTo(snp.width).multipliedBy(0.714)
        }
    }
    
    private func layoutTeamTypeLabel() {
        teamTypeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.trailing.equalToSuperview().inset(7)
            $0.height.equalTo(32)
        }
        teamTypeLabel.layer.cornerRadius = 16
        teamTypeLabel.layer.masksToBounds = true
    }
    
    private func layoutTagView() {
        tagView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(snp.width).multipliedBy(0.714)
            $0.height.equalTo(24)
        }
    }
    
    private func layoutLeaderLabel() {
        leaderLabel.snp.makeConstraints {
            $0.trailing.equalTo(timeAgoLabel.snp.trailing)
            $0.bottom.equalTo(timeAgoLabel.snp.top).offset(-2)
        }
    }
    
    private func layoutTimeAgoLabel() {
        timeAgoLabel.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(15)
        }
    }
    
}
