//
//  EndpointProtocol.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 14.11.2025.
//

import Foundation

protocol EndpointProtocol {
    var baseUrl: String {get}
    var path : String {get}
    var method : HttpMethod {get}
    var parameters : [URLQueryItem]? {get}
    func request () -> URLRequest
}
