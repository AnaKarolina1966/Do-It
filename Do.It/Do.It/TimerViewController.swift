//
//  ModalController.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 19/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var propriedadesTodo : [Todo] = [Todo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let topContainerView = UIView()
    let tableView = UITableView()
    let bottomContainerView = UIView()
    var safeArea = UILayoutGuide()

    let playButton: UIButton = {
        let button = AspectButton()
        button.setTitleColor(.systemPink, for: .normal)
        button.setTitle("PLAY", for: .normal)
        button.setImage(UIImage(named: "Play"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(timerStarts), for: .touchUpInside)
        button.layoutSubviews()
        return button
    }()
    
    @objc func timerStarts() {
        
    }
    
    let stopButton: UIButton = {
           let button = AspectButton()
           button.setTitleColor(.systemPink, for: .normal)
           button.setTitle("STOP", for: .normal)
           button.setImage(UIImage(named: "Stop"), for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.layoutSubviews()
           return button
       }()
    
    let repeatButton: UIButton = {
        let button = AspectButton()
        button.setTitleColor(.systemPink, for: .normal)
        button.setTitle("REPEAT", for: .normal)
        button.setImage(UIImage(named: "Repeat"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layoutSubviews()
        return button
    }()
    
    let addTaskButton : UIButton = {
        let button = UIButton()
        let largeConfiguration = UIImage.SymbolConfiguration(scale: .large)
        let imageSymbol = UIImage(systemName: "plus.circle", withConfiguration: largeConfiguration)
        let imageSymbolNew = imageSymbol?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        button.setImage(imageSymbolNew, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let configTimerButton : UIButton = {
        let button = UIButton()
        let mediumConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let imageSymbol = UIImage(systemName: "gear", withConfiguration: mediumConfiguration)
        let imageSymbolNew = imageSymbol?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        button.setImage(imageSymbolNew, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(configModal), for: .touchUpInside)
        return button
    }()
    
    @objc func configModal() {
        
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        addSubviews()
        setupTableView()
        setupTimerContainer()
        setupButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIConfig.readAllTodos { retorno in
            self.propriedadesTodo = retorno
            print(retorno)
        }
    }
        
}
