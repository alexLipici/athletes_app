//
//  AthleteDetailsViewController.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit
import Combine
import PKHUD
import Kingfisher
import RxSwift

class AthleteDetailsViewController: BaseViewController {

    let viewModel: AthleteDetailsViewModel
    private let _view: AthleteDetailsView
    
    private var observers = Set<AnyCancellable>()
    private let disposeBag = DisposeBag()
    
    init(viewModel: AthleteDetailsViewModel) {
        self.viewModel = viewModel
        self._view = AthleteDetailsView()
        
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
        
        title = viewModel.title

        addSubscribers()
        setContent()
        
        viewModel.loadData()
    }
    
    private func addSubscribers() {
        viewModel.$isLoading
            .delay(for: .seconds(0.15), scheduler: RunLoop.main)
            .sink { isLoading in
                DispatchQueue.main.async {
                    isLoading ? HUD.show(.progress) : HUD.hide(animated: true)
                }
            }
            .store(in: &observers)
        
        viewModel.outputs.fetchedMedals
            .subscribe(onNext: { [weak self] results in
                DispatchQueue.main.async {
                    self?.attachMedals(results)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func attachMedals(_ results: [AthleteResultModel]) {
        _view.attachMedalsView()
        _view.medalsView.setContent(results: results)
    }
    
    private func setContent() {
        let athleteInfo = viewModel.getAthelteInfo()
        
        _view.headerView.imageView.kf.setImage(
            with: athleteInfo.photoUrl,
            placeholder: Images.imagePlaceholder,
            options: [.imageModifier(KingfisherCroppedImageModifier())]
        )
        _view.headerView.athleteNameLabel.text = String(format: "Name: %@", athleteInfo.name)
        _view.headerView.birthDayLabel.text = String(format: "Birthday: %@", athleteInfo.birthday)
        _view.headerView.weightLabel.text = String(format: "Weight: %@", athleteInfo.weight)
        _view.headerView.heightLabel.text = String(format: "Height: %@", athleteInfo.height)
        
        _view.bioView.textView.text = viewModel.getBioText()
    }
}
