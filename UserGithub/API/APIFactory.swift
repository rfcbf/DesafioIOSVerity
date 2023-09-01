//
//  ApiFactory.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

public class APIFactory {
    static func decode(users fromJSON: Dictionary<String, Any>) -> UsersModel? {
        if let jsonData: Data =  try? JSONSerialization.data(withJSONObject: fromJSON, options: .prettyPrinted) {
            do {
                let codable = try JSONDecoder().decode(UsersModel.self, from: jsonData)
                return codable
            } catch {
                Logs.d(error)
            }
        }
        return nil
    }
    
    static func decode(detailUser fromJSON: Dictionary<String, Any>) -> DetailUserModel? {
        if let jsonData: Data =  try? JSONSerialization.data(withJSONObject: fromJSON, options: .prettyPrinted) {
            do {
                let codable = try JSONDecoder().decode(DetailUserModel.self, from: jsonData)
                return codable
            } catch {
                Logs.d(error)
            }
        }
        return nil
    }
    
    static func decode(repo fromJSON: Dictionary<String, Any>) -> RepoModel? {
        if let jsonData: Data =  try? JSONSerialization.data(withJSONObject: fromJSON, options: .prettyPrinted) {
            do {
                let codable = try JSONDecoder().decode(RepoModel.self, from: jsonData)
                return codable
            } catch {
                Logs.d(error)
            }
        }
        return nil
    }
}
