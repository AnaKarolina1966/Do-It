//
//  ViewController.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 17/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainBlue = UIColor(red:20/255, green:33/255, blue:61/255, alpha:1)
    static var mainGreen = UIColor(red:224/255, green:236/255, blue:228/255, alpha:1)
    static var mainGrey = UIColor(red:121/255, green:122/255, blue:126/255, alpha:1)
}

class ViewController: UIViewController {
    
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
        descriptionView.text = """
        Pomodoro is a technique wich divide focus within minutes.Perfect for start to study or
        work in home.
        """
        descriptionView.textColor = .black
        descriptionView.contentMode = .scaleAspectFit
        descriptionView.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
        descriptionView.textAlignment = .center
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        self.view.addSubview(image)
        self.view.addSubview(labelTitle)
        self.view.addSubview(labelSub)
        self.view.addSubview(labelDescription)
                
        //image setup layout
        self.image.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.image.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 170
                ).isActive = true
        self.image.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.image.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 30).isActive = true
        
        //Title label Setup
        self.labelTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        self.labelTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.labelTitle.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.labelTitle.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //Subtitle label Setup
        self.labelSub.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        self.labelSub.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.labelSub.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.labelSub.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
        //Description Label Setup
        self.labelDescription.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        self.labelDescription.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.labelDescription.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.labelDescription.heightAnchor.constraint(equalToConstant: 790).isActive = true

    }
    
}
