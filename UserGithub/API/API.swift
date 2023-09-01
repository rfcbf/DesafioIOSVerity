//
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
        NetworkRequest.instance.get(url: url,
                                    headers: nil,
                                    completion: { json in
            
            var responseUser: [UsersModel] = []
            
            if let users = json as? Array<Any> {
                for user in users {
                    if let respUSER = user as? Dictionary<String, Any> {
                        if let result = APIFactory.decode(users: respUSER) {
                            responseUser.append(result)
                        } else {
                            Logs.e("Erro ao parsear a resposta da API.")
                            completion(nil)
                        }
                    } else {
                        Logs.e("Erro ao parsear JSON: \(json)")
                        completion(nil)
                    }
                }
            } else {
                Logs.e("Erro ao parsear JSON: \(json)")
                completion(nil)
            }

            completion(responseUser)
        })
    }
    
    func getDeatilUsers(user: String, completion: @escaping DetailUsersHandler) {
        let url = APIBuilder().getDetailUser(user: user).buildURL()
        NetworkRequest.instance.get(url: url,
                                    headers: nil,
                                    completion: { json in
            
            if let response = json as? Dictionary<String, Any> {
                if let result = APIFactory.decode(detailUser: response) {
                    completion(result)
                } else {
                    Logs.e("Erro ao parsear a resposta da API.")
                    completion(nil)
                }
            } else {
                Logs.e("Erro ao parsear JSON: \(json)")
                completion(nil)
            }

        })
    }

    func getRepo(user: String, completion: @escaping RepoHandler) {
        let url = APIBuilder().getRepos(user: user).buildURL()
        NetworkRequest.instance.get(url: url,
                                    headers: nil,
                                    completion: { json in
            
            var responseRepos: [RepoModel] = []
            
            if let repos = json as? Array<Any> {
                for repo in repos {
                    if let respRepo = repo as? Dictionary<String, Any> {
                        if let result = APIFactory.decode(repo: respRepo) {
                            responseRepos.append(result)
                        } else {
                            Logs.e("Erro ao parsear a resposta da API.")
                            completion(nil)
                        }
                    } else {
                        Logs.e("Erro ao parsear JSON: \(json)")
                        completion(nil)
                    }
                }
            } else {
                Logs.e("Erro ao parsear JSON: \(json)")
                completion(nil)
            }

            completion(responseRepos)
        })
    }
}
