//
//  PageCell.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 18/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            image.image = UIImage(named: unwrappedPage.imageName)
            labelTitle.text = unwrappedPage.titleTex
            labelSub.text = unwrappedPage.subText
            labelDescription.text = unwrappedPage.descriptionText
        }
    }
    
    let image: UIImageView = {
        var image = UIImage(named: "cronometro")
        var imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelTitle : UILabel = {
        var titleView = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 30))
        titleView.textAlignment = .center //For center alignment
        titleView.text = "STIMULATE YOURSELF"
        titleView.textColor = .black
        titleView.contentMode = .scaleAspectFit
        titleView.font = UIFont.boldSystemFont(ofSize: 18)
        titleView.textAlignment = .center
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        return titleView
    }()
    
    let labelSub : UILabel = {
        var subsView = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 30))
        subsView.textAlignment = .center //For center alignment
        subsView.text = "With a break"
        subsView.textColor = .black
        subsView.contentMode = .scaleAspectFit
        subsView.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.thin)
        subsView.textAlignment = .center
        subsView.translatesAutoresizingMaskIntoConstraints = false
        
        return subsView
    }()
    
    let labelDescription : UILabel = {
        var descriptionView = UILabel()
        descriptionView.numberOfLines = 0
        descriptionView.textAlignment = .center //For center alignment
        descriptionView.textColor = .black
        descriptionView.contentMode = .scaleAspectFit
        descriptionView.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        descriptionView.textAlignment = .center
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout() {
        let topImageContainerView = UIView()
//        addSubview(labelDescription)
        addSubview(topImageContainerView)
        
        topImageContainerView.addSubview(image)
        topImageContainerView.addSubview(labelTitle)
        topImageContainerView.addSubview(labelSub)
        topImageContainerView.addSubview(labelDescription)
        
        self.image.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor, constant: 15).isActive = true
        self.image.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 80).isActive = true
        self.image.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        self.image.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor).isActive = true
        
        topImageContainerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topImageContainerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//
        //Title label Setup. Mode: normal ####
        self.labelTitle.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 0).isActive = true
        self.labelTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3).isActive = true
        self.labelTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.labelTitle.heightAnchor.constraint(equalToConstant: 150).isActive = true

        //Subtitle label Setup. Mode: normal ####
        self.labelSub.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 5).isActive = true
        self.labelSub.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        self.labelSub.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.labelSub.heightAnchor.constraint(equalToConstant: 190).isActive = true

        //Description Label Setup. Mode: normal ####
        self.labelDescription.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 30).isActive = true
        self.labelDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.labelDescription.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.labelDescription.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
