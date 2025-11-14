//
//  WhatchlistViewModel.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import Foundation

protocol WhatchlistViewModelProtocol {
    
    var delegate: WhatchlistViewModelDelegate? { get set }
    var popularMovies: [MovieResults] { get set }
    var shouldDownloadMore: Bool { get set }
    
    func getPopulerMovie()
    func getSearchMovie(quary: String)
}

protocol WhatchlistViewModelDelegate: AnyObject {
    func reloadData()
}

final class WhatchlistViewModel: WhatchlistViewModelProtocol {
    
    weak var delegate: WhatchlistViewModelDelegate?
    var popularMovies: [MovieResults] = []
    private var page: Int = 1
    var shouldDownloadMore: Bool = true
    
    func getPopulerMovie() {
        shouldDownloadMore = false
        MovieService.shared.getMovie(page: page) { [weak self] result in
            switch result {
            case .success(let data):
                self!.popularMovies.append(contentsOf: data.results!)
                self!.page += 1
                self!.delegate?.reloadData()
                self!.shouldDownloadMore = true
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getSearchMovie(quary: String) {
        shouldDownloadMore = false
        MovieService.shared.getMovieSearch(quary: quary, page: 1) { [weak self] responseData in
            switch responseData {
            case .success(let data):
                self!.popularMovies = []
                self!.popularMovies.append(contentsOf: data.results!)
                self!.delegate?.reloadData()
                self!.shouldDownloadMore = true
            case.failure(_):
                break
            }
        }
    }
    
}
