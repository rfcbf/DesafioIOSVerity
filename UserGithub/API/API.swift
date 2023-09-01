//  API.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

public class API {
    
    public static let instance: API = API()
    
    private init(){}
    
    func getUsers(completion: @escaping UsersHandler) {
        let url = APIBuilder().getUsers().buildURL()
        NetworkRequest.instance.get(url: url, headers: nil) { json in
            var responseUser: [UsersModel] = []
            
            guard let users = json as? [[String: Any]] else {
                Logs.e("Erro ao parsear JSON: \(json)")
                completion(nil)
                return
            }
            
            for user in users {
                guard let result = APIFactory.decode(users: user) else {
                    Logs.e("Erro ao parsear a resposta da API.")
                    completion(nil)
                    return
                }
                responseUser.append(result)
            }
            
            completion(responseUser)
        }
    }
    
    func getDeatilUsers(user: String, completion: @escaping DetailUsersHandler) {
        let url = APIBuilder().getDetailUser(user: user).buildURL()
        NetworkRequest.instance.get(url: url, headers: nil) { json in
            guard let response = json as? [String: Any] else {
                Logs.e("Erro ao parsear JSON: \(json)")
                completion(nil)
                return
            }
            
            guard let result = APIFactory.decode(detailUser: response) else {
                Logs.e("Erro ao parsear a resposta da API.")
                completion(nil)
                return
            }
            
            completion(result)
        }
    }

    func getRepo(user: String, completion: @escaping RepoHandler) {
        let url = APIBuilder().getRepos(user: user).buildURL()
        NetworkRequest.instance.get(url: url, headers: nil) { json in
            var responseRepos: [RepoModel] = []
            
            guard let repos = json as? [[String: Any]] else {
                Logs.e("Erro ao parsear JSON: \(json)")
                completion(nil)
                return
            }
            
            for repo in repos {
                guard let result = APIFactory.decode(repo: repo) else {
                    Logs.e("Erro ao parsear a resposta da API.")
                    completion(nil)
                    return
                }
                responseRepos.append(result)
            }
            
            completion(responseRepos)
        }
    }
}
