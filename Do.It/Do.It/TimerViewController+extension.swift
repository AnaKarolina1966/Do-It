//
//  TimerViewController+extension.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 19/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

extension TimerViewController {
    func addSubviews() {
        view.addSubview(topContainerView)
        view.addSubview(addTaskButton)
        view.addSubview(playButton)
        view.addSubview(stopButton)
        view.addSubview(repeatButton)
        view.addSubview(configTimerButton)
        view.addSubview(tableView)
    }
    
    func setupTimerContainer() {
        topContainerView.backgroundColor = .mainGreen
        
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func setupButtons() {
        
        playButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        playButton.centerYAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        playButton.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        
        stopButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        stopButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stopButton.centerYAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        stopButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -20).isActive = true
        
        repeatButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        repeatButton.centerYAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        repeatButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 20).isActive = true
        
        addTaskButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addTaskButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addTaskButton.centerYAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 30).isActive = true
        addTaskButton.centerXAnchor.constraint(equalTo: playButton.centerXAnchor, constant: 160).isActive = true
        
        configTimerButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        configTimerButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        configTimerButton.centerYAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 50).isActive = true
        configTimerButton.centerXAnchor.constraint(equalTo: playButton.centerXAnchor, constant: 150).isActive = true
        
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 230).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      }
    
    func deleteTodos(indexPath: IndexPath) {
         DispatchQueue.main.async {
            self.tableView.beginUpdates()
            self.propriedadesTodo.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .right)
            self.tableView.endUpdates()
        }
    }
}

extension TimerViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.propriedadesTodo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = propriedadesTodo[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            APIConfig.deleteTodo(id: propriedadesTodo[indexPath.row].id!) { retorno in
                self.deleteTodos(indexPath: indexPath)
            }
        }
    }
    
}
