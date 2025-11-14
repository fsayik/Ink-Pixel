//
//  MovieEndpoint.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 20.10.2025.
//

import Foundation

enum MovieEndpoint {
    case getMovie(page: Int)
    case getMovieDetail(id: Int)
    case getMovieSearch(quary: String, page: Int)
    case getMovieCredit(id: Int)
    case getMovieVideos(id: Int)
}

extension MovieEndpoint: EndpointProtocol {
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
        case .getMovieCredit(let id):
            return "/3/movie/\(id)/credits"
        case .getMovieVideos(let id):
            return "/3/movie/\(id)/videos"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getMovie,
                .getMovieDetail,
                .getMovieSearch,
                .getMovieCredit,
                .getMovieVideos:
            return .get
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getMovie(let page):
            return [URLQueryItem(name: "api_key", value: Constants.movieApiKey),
                    URLQueryItem(name: "language", value: Constants.languageForMovieApi),
                    URLQueryItem(name: "page", value:"\(page)")]
            
        case .getMovieDetail, .getMovieCredit, .getMovieVideos:
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
        return request
        
    }
    
}
