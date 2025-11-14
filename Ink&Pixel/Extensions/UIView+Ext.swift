//
//  UIView+Ext.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 9.11.2025.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
    
    
}
