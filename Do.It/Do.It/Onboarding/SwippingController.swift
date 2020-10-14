//
//  SwippingController.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 18/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "cronometro", titleTex: "MOTIVATE YOURSELF", subText: "With a break", descriptionText: "Pomodoro is a technique wich divide\n focus within minutes. Perfect for start to study or\n work in home."),
        Page(imageName: "lista", titleTex: "GET YOUR THINGS DONE", subText: "Inside your app", descriptionText: "You can insert a task and start your timer,\n or just set the timer on. You can delete them when you're fishined!")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrev() {
        let prevIndex = max(pageControls.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControls.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext() {
        let nextIndex = max(pageControls.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControls.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if nextIndex == 2 {
            //Aqui a gente tem que pegar a scene que tá rodando a aplicação
            guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            //Ai a gente módifca o rootview controller da window
            scene.window?.rootViewController = TimerViewController()
        }
        
    }
    
    lazy var pageControls: UIPageControl = {
        let pageC = UIPageControl()
        pageC.currentPage = 0
        pageC.numberOfPages = pages.count
        pageC.pageIndicatorTintColor = .fadedPink
        pageC.currentPageIndicatorTintColor = .systemPink
        
        return pageC
    }()
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControls, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
            bottomControlsStackView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let axis = targetContentOffset.pointee.x
        pageControls.currentPage = Int(axis / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .mainGreen
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        setupBottomControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
