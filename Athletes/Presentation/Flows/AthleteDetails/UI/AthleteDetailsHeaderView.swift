//
//  AthleteDetailsHeaderView.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit

class AthleteDetailsHeaderView: UIView {
    
    let imageView = UIImageView()
    private let infosStackView = UIBuilder.makeContentStackView(spacing: 3)
    let athleteNameLabel = UIBuilder.makeMediumLabel(ofSize: 15)
    let birthDayLabel = UIBuilder.makeRegularLabel(ofSize: 13)
    let weightLabel = UIBuilder.makeRegularLabel(ofSize: 13)
    let heightLabel = UIBuilder.makeRegularLabel(ofSize: 13)
    
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
        addSubview(imageView)
        addSubview(infosStackView)
        
        infosStackView.addArrangedSubview(athleteNameLabel)
        infosStackView.addArrangedSubview(birthDayLabel)
        infosStackView.addArrangedSubview(weightLabel)
        infosStackView.addArrangedSubview(heightLabel)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        infosStackView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).inset(-16)
            make.centerY.equalTo(imageView.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setLayout() {
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
}
