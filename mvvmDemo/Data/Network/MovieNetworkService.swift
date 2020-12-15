//
//  MovieNetwork.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation
import Alamofire

class MovieNetworkService {
    
    private static var instance: MovieNetworkService? = nil
    
    static func getInstance() -> MovieNetworkService {
        if MovieNetworkService.instance == nil {
            MovieNetworkService.instance = MovieNetworkService()
        }
        return MovieNetworkService.instance!
    }

//    func fetchMovies(_ compeletion: @escaping (MutableLiveData<[Movie]>) -> Void) {
    func fetchMovies(_ compeletion: @escaping (Result<MutableLiveData<[Movie]>?,ErrorResult>) -> Void) {
        var urlString = "https://api.themoviedb.org/3/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc"
        AF.request(urlString).response {
            response in
            if response.response?.statusCode == 200 {
            
                var moviesArr = [Movie]()
                
                let json = try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any]
                
                let movies = json!["results"] as! [[String: Any]]

                for item in movies {
                    var movie = Movie(title: item["title"] as? String ?? "", releaseDate: item["release_date"] as? String ?? "")
                    moviesArr.append(movie)
                    
                }
                compeletion(.success(MutableLiveData(moviesArr)))
                
                print(response)
            } else {
                compeletion(.error(.network(ErrorReason.noInternetConnection.rawValue)))
            }
        }
    }
}
