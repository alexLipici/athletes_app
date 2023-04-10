//
//  GameAthletesTableViewCell.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit

class GameAthletesTableViewCell: UITableViewCell {
    private let cardView = UIBuilder.makeCardView(cornerRadius: 10)
    private let titleLabel = UIBuilder.makeMediumLabel(ofSize: 15)
    private let carouselCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var viewModel: GameAthletesTableViewCellViewModel? {
        didSet {
            setDataSource()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubviews()
        setConstraints()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(carouselCollectionView)
    }
    
    private func setConstraints() {
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        carouselCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
    }
    
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width: 150, height: 200)
        carouselLayout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        carouselCollectionView.collectionViewLayout = carouselLayout
        carouselCollectionView.showsHorizontalScrollIndicator = false
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        carouselCollectionView.backgroundColor = .clear
        carouselCollectionView.register(cell: AthleteCollectionViewCell.self)
    }
    
    private func setDataSource() {
        titleLabel.text = viewModel?.title
        carouselCollectionView.reloadData()
    }
}

extension GameAthletesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemsInSection(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let athleteName = viewModel?.athleteName(at: indexPath) else { return UICollectionViewCell() }
        
        let cell: AthleteCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(imageUrl: viewModel?.athleteAvatarUrl(at: indexPath), text: athleteName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSelectItemAt(indexPath)
    }
}
