//
//  GamesListViewController.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import UIKit
import Combine
import PKHUD

class GamesListViewController: BaseViewController {
    
    let viewModel: GamesListViewModel
    private let _view: GamesListView
    
    private var observers = Set<AnyCancellable>()
    
    init(viewModel: GamesListViewModel) {
        self.viewModel = viewModel
        self._view = GamesListView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Olympic Athletes"
        setupTableView()
        addSubscribers()
        
        viewModel.loadData()
    }
    
    private func setupTableView() {
        _view.tableView.delegate = self
        _view.tableView.dataSource = self
        _view.tableView.register(cell: GameAthletesTableViewCell.self)
        
        _view.tableView.contentInset = .init(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    private func addSubscribers() {
        viewModel.$screenState
            .delay(for: .seconds(0.15), scheduler: RunLoop.main)
            .sink { [weak self] state in
                DispatchQueue.main.async {
                    self?.screenStateDidChange(state)
                }
            }
            .store(in: &observers)
    }
    
    private func screenStateDidChange(_ currentState: GamesListViewModel.ScreenState) {
        switch currentState {
        case .loading:
            HUD.show(.progress)
        case .empty:
            HUD.hide(animated: true)
            #warning("TODO: - implement empty instance")
        case .list:
            HUD.hide(animated: true)
            _view.tableView.reloadData()
        case .error(let error):
            HUD.hide(animated: true)
            showErrorAlertCloseScreen(error)
            
        case .idle:
            break
        }
    }
    
    private func showErrorAlertCloseScreen(_ error: String) {
        #warning("TODO: - implement error instance")
    }
}

extension GamesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel.makeCellViewModel(at: indexPath) else {
            return .init()
        }
        
        let cell: GameAthletesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
}
