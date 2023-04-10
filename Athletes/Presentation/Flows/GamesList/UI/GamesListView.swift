//
//  GamesListView.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import UIKit

class GamesListView: UIView {

    let tableView = UITableView(frame: .zero, style: .plain)
    
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
        addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setLayout() {
        backgroundColor = .systemGroupedBackground
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
}
