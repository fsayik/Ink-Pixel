//
//  MovieDetailViewModel.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 8.11.2025.
//

import Foundation


protocol MovieDetailViewModelProtocol {
    var movieId: Int {get set}
    var movieDetail: MovieDetail? {get set}
    var movieCastResult: [Cast]? {get set}
    var movieCreditResult: [Cast]? {get set}
    var movieVideosResult: [VideosResult]? {get set}
    var delegate: MovieDetailViewModelDelegate? {get set}
    
    func getMovieInfoData()
    func getCastData()
    func getCreditData()
    func getVideosData()
}

protocol MovieDetailViewModelDelegate: AnyObject {
    func reloadData()
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    weak var delegate: MovieDetailViewModelDelegate?
    
    var movieDetail: MovieDetail?
    var movieCastResult: [Cast]? = []
    var movieCreditResult: [Cast]? = []
    var movieVideosResult: [VideosResult]? = []
    var movieId: Int
    
    init (movieId: Int) {
        self.movieId = movieId
    }
    
    func getMovieInfoData() {
        MovieService.shared.getMovieDetail(id: movieId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.movieDetail = data
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCreditData() {
        MovieService.shared.getMovieCredit(id: movieId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.movieCreditResult = data.crew
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCastData() {
        MovieService.shared.getMovieCredit(id: movieId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.movieCastResult = data.cast
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getVideosData() {
        MovieService.shared.getMovieVideos(id: movieId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.movieVideosResult = data.results
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
