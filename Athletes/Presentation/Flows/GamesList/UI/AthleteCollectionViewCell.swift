//
//  AthleteCollectionViewCell.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit
import Kingfisher

class AthleteCollectionViewCell: UICollectionViewCell {    
    private let imageView = UIImageView()
    private let textLabel = UIBuilder.makeRegularLabel(ofSize: 13)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.top.leading.trailing.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setLayout() {
        backgroundColor = .white
        
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
}

extension AthleteCollectionViewCell {
    func configure(imageUrl: String?, text: String) {
        textLabel.text = text
        
        guard let imageUrl = imageUrl else {
            imageView.image = Images.imagePlaceholder
            return
        }
        
        imageView.kf.setImage(
            with: URL(string: imageUrl),
            placeholder: Images.imagePlaceholder,
            options: [.imageModifier(KingfisherCroppedImageModifier())]
        )
    }
}
