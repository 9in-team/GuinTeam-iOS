//
//  TagView.swift
//  GuinTeam-iOS
//
//  Created by 조상현 on 2/17/24.
//

import UIKit
import SnapKit

final class TagView: BaseView {
    
    private let tagHeight: CGFloat
    
    private let scrollView = UIScrollView()
        .then {
            $0.showsHorizontalScrollIndicator = false
        }
    
    private let stackView = UIStackView()
        .then {
            $0.axis = .horizontal
            $0.spacing = 10
        }
    
    init(tagHeight: CGFloat) {
        self.tagHeight = tagHeight
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTag(_ tagList: [String]) {
        for tag in tagList {
            stackView.addArrangedSubview(makeLabel(from: tag))
        }
    }
    
    private func makeLabel(from tag: String) -> UILabel {
        let font: UIFont = .appFont(.robotoRegular, size: 13)
        
        let label = UILabel()
            .then {
                $0.text = tag
                $0.font = font
                $0.textAlignment = .center
                $0.textColor = .appColor(.titleLabel)
                $0.layer.borderWidth = 1.0
                $0.layer.borderColor = UIColor(hex: "000000", alpha: 0.26).cgColor
                $0.layer.cornerRadius = tagHeight / 2
            }
        label.snp.makeConstraints {
            let size = (tag as NSString).size(withAttributes: [.font: font])
            $0.width.equalTo(size.width + 20)
            $0.height.equalTo(tagHeight)
        }
        return label
    }
    
    override func layout() {
        super.layout()
        
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        layoutScrollView()
        layoutStackview()
    }
    
    private func layoutScrollView() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func layoutStackview() {
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
