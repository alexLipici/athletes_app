//
//  AthleteDetailsView.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit
import SnapKit

class AthleteDetailsView: UIView {
    let scrollView = UIScrollView()
    let contentStackView = UIBuilder.makeContentStackView(spacing: 15)
    let headerView = AthleteDetailsHeaderView()
    lazy var medalsView = AthleteDetailsMedalsView()
    let bioView = AthleteDetailsBioView()
    
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
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(headerView)
        contentStackView.addArrangedSubview(bioView)
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
            make.centerX.equalToSuperview()
        }
    }
    
    private func setLayout() {
        backgroundColor = .white
    }
    
    func attachMedalsView() {
        contentStackView.insertArrangedSubview(medalsView, at: 1)
    }
}
