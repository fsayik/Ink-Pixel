//
//  WhatchlistViewModel.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import Foundation

protocol WhatchlistViewModelProtocol {
    var delegate: WhatchlistViewModelDelegate? { get set }
}

protocol WhatchlistViewModelDelegate: AnyObject {
    
}

final class WhatchlistViewModel: WhatchlistViewModelProtocol {
    weak var delegate: WhatchlistViewModelDelegate?
    
    
}
