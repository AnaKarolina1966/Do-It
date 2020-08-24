//
//  SwippingController+extension.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 18/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

extension SwippingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControls.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                 let indexPath = IndexPath(item: self.pageControls.currentPage, section: 0)
                 self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        })
        
    }
}
