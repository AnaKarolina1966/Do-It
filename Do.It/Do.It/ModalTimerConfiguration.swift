//
//  ModalTimerConfiguration.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 26/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

class ModalTimerConfiguration: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainGreen
        setupModalButtons()
    }
    
    let backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let mediumConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let imageSymbol = UIImage(systemName: "chevron.left", withConfiguration: mediumConfiguration)
        let imageSymbolNew = imageSymbol?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        button.setImage(imageSymbolNew, for: .normal)
        button.setTitle("BACK", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
        }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Set Timer"
        label.textAlignment = .center //For center alignment
        label.textColor = .black
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        }()
    
    let finishButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    let largeConfiguration = UIImage.SymbolConfiguration(scale: .large)
    let imageSymbol = UIImage(systemName: "plus", withConfiguration: largeConfiguration)
    let imageSymbolNew = imageSymbol?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
    button.setImage(imageSymbolNew, for: .normal)
    return button
    }()
    
//    let sliderTimeForSession : UIControl = {
//        let slider = UIControl()
//        
//        return slider
//    }
    
    func setupModalButtons() {
        let topButtonsStackView = UIStackView(arrangedSubviews: [backButton, titleLabel, finishButton])
        topButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topButtonsStackView)
        topButtonsStackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            topButtonsStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            topButtonsStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            topButtonsStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            topButtonsStackView.heightAnchor.constraint(equalToConstant: 50),
            topButtonsStackView.widthAnchor.constraint(equalToConstant: 500)
        ])
        
    }
}
