//
//  AthleteDetailsBioView.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit

class AthleteDetailsBioView: UIView {
    private let titleLabel = UIBuilder.makeMediumLabel(ofSize: 17)
    let textView = UIBuilder.makeTextView(textAlignment: .left)
    
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
        addSubview(textView)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-5)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func setLayout() {
        backgroundColor = .clear
        
        titleLabel.text = "Bio"
    }
}
