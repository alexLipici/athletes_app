//
//  BaseViewController.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 09.04.2023.
//

import UIKit

class BaseViewController: UIViewController {
    deinit {
        print("☠️ deinit called on \(NSStringFromClass(type(of: self)))")
    }
}
