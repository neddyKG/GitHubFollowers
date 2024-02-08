//
//  PersistenceManager.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 7/2/24.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

// We use enum cause you can't initilize it empty vs. struct, you can.
enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var recievedFavorites = favorites
                if (actionType == .add) {
                    guard !recievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    recievedFavorites.append(favorite)
                }
                
                if (actionType == .remove) {
                    recievedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: recievedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    // We have de encode/decode cause it gets saved as data.
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
            
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
