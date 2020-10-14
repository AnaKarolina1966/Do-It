//
//  ViewController+Extension.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 19/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentOnRoot(`with` viewController : UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(navigationController, animated: false, completion: nil)
    }
}
