//
//  NetworkRequest.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func get(url: String, headers: HTTPHeaders?, completion: @escaping (Any) -> Void)
}

public class NetworkRequest: NetworkProtocol {
    public static let instance: NetworkRequest = NetworkRequest()
    
    private init() {}
    
    func get(url: String, headers: HTTPHeaders?, completion: @escaping (Any) -> Void) {
        self.request(url: self.asURL(url),
                     method: HTTPMethod.get,
                     parameters: nil,
                     headers: headers,
                     completion: completion)
    }

    private func request(url: URLConvertible,
                         method: HTTPMethod,
                         parameters: Parameters?,
                         headers: HTTPHeaders?,
                         completion: @escaping (Any) -> Void) {
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let json):
                completion(json)
                break
            case .failure(let error):
                Logs.e(error.localizedDescription)
                break
            }
        })
    }
    
    private func asURL(_ sUrl: String) -> URLConvertible {
        guard let url = URL(string: sUrl) else {
            fatalError("Erro ao criar URL: \(sUrl)")
        }
        return url
    }
}
