//
//  AthleteDetailsMedalsView.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit

class AthleteDetailsMedalsView: UIView {
    private let titleLabel = UIBuilder.makeMediumLabel(ofSize: 17)
    private let medalsStackView = UIBuilder.makeContentStackView(spacing: 5)
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setConstraints()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(medalsStackView)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        medalsStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-5)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func setLayout() {
        backgroundColor = .clear
        
        titleLabel.text = "Medals"
    }
    
    func setContent(results: [AthleteResultModel]) {
        for result in results {
            if let label = makeLabelForResult(result) {
                label.snp.makeConstraints { make in
                    make.height.equalTo(30)
                }
                medalsStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func makeLabelForResult(_ result: AthleteResultModel) -> UILabel? {
        guard result.bronze + result.silver + result.gold > 0 else { return nil }
        
        let completeText = NSMutableAttributedString(string: String(format: "%@: ", result.city))
        
        if result.bronze > 0 {
            let attrString = getAttributedStringFor(medal: .bronze, count: result.bronze)
            completeText.append(attrString)
        }
        
        if result.silver > 0 {
            let attrString = getAttributedStringFor(medal: .silver, count: result.silver)
            completeText.append(attrString)
        }
        
        if result.gold > 0 {
            let attrString = getAttributedStringFor(medal: .gold, count: result.gold)
            completeText.append(attrString)
        }
        
        let label = UIBuilder.makeRegularLabel(ofSize: 15)
        label.textAlignment = .left
        label.attributedText = completeText
        
        return label
    }
    
    private func getAttributedStringFor(medal: ResultScoreWeight, count: Int) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        switch medal {
        case .bronze:
            imageAttachment.image = Images.bronzeBadge
        case .silver:
            imageAttachment.image = Images.silverBadge
        case .gold:
            imageAttachment.image = Images.goldBadge
        }
        
        let imageOffsetY: CGFloat = -2.0
        imageAttachment.bounds = CGRect(
            x: 0,
            y: imageOffsetY,
            width: imageAttachment.image!.size.width,
            height: imageAttachment.image!.size.height
        )
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "\(count) ")
        completeText.append(attachmentString)
        
        let textAfterIcon = NSAttributedString(string: "  ")
        completeText.append(textAfterIcon)
        
        return completeText
    }
}

