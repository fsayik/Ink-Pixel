//
//  MovieEndpoint.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 20.10.2025.
//

import Foundation

protocol MovieEndpointProtocol {
    var baseUrl: String {get}
    var path : String {get}
    var method : HttpMethod {get}
    var parameters : [URLQueryItem]? {get}
    func request () -> URLRequest
}

enum MovieEndpoint {
    case getMovie(page: Int)
    case getMovieDetail(id: Int)
    case getMovieSearch(quary: String, page: Int)
}

extension MovieEndpoint: MovieEndpointProtocol {
    var baseUrl: String {
        return "https://api.themoviedb.org/"
    }
    
    var path: String {
        switch self {
        case .getMovie:
            return "/3/movie/popular"
        case .getMovieDetail(let id):
            return "/3/movie/\(id)"
        case .getMovieSearch:
            return "/3/search/movie"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getMovie, .getMovieDetail, .getMovieSearch:
            return .get
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getMovie(let page):
            return [URLQueryItem(name: "api_key", value: Constants.movieApiKey),
                    URLQueryItem(name: "language", value: Constants.languageForMovieApi),
                    URLQueryItem(name: "page", value:"\(page)")]
            
        case .getMovieDetail:
            return [URLQueryItem(name: "api_key", value: Constants.movieApiKey),
                    URLQueryItem(name: "language", value: Constants.languageForMovieApi)]
            
        case .getMovieSearch(let quary, let page):
            return [URLQueryItem(name: "query", value: quary),
                    URLQueryItem(name: "api_key", value: Constants.movieApiKey),
                    URLQueryItem(name: "language", value: Constants.languageForMovieApi),
                    URLQueryItem(name: "page", value:"\(page)")]
        }
    }

    func request() -> URLRequest {
        guard var comp = URLComponents(string: baseUrl) else { fatalError("URL ERROR") }
        comp.path = path
        comp.queryItems = parameters
        
        var request = URLRequest(url: comp.url!)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        return request
        
    }
    
}
