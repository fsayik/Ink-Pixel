//
//  MovieService.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import Foundation

protocol MovieServiceable {
    func getMovie(page: Int, completion: @escaping (Result<Movie, Error>) -> Void)
    func getMovieSearch(quary: String, page: Int, completion: @escaping (Result<Movie, Error>) -> Void)
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
    func getMovieCredit(id: Int, completion: @escaping (Result<MovieCredits, Error>) -> Void)
    func getMovieVideos(id: Int, completion: @escaping (Result<MovieVideos, Error>) -> Void)
}

final class MovieService: MovieServiceable, NetworkManager {
    
    static let shared: MovieServiceable = MovieService()
    
    private init(){}
    
    
    func getMovie(page: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let endpoint = MovieEndpoint.getMovie(page: page)
        execute(endpoint, completion: completion)
    }
    
    func getMovieSearch(quary: String, page: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let endpoint = MovieEndpoint.getMovieSearch(quary: quary, page: page)
        execute(endpoint, completion: completion)
    }
    
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        let endpoint = MovieEndpoint.getMovieDetail(id: id)
        execute(endpoint, completion: completion)
    }
    
    func getMovieCredit(id: Int, completion: @escaping (Result<MovieCredits, Error>) -> Void) {
        let endpoint = MovieEndpoint.getMovieCredit(id: id)
        execute(endpoint, completion: completion)
    }
    func getMovieVideos(id: Int, completion: @escaping (Result<MovieVideos, Error>) -> Void) {
        let endpoint = MovieEndpoint.getMovieVideos(id: id)
        execute(endpoint, completion: completion)
    }
    
}
