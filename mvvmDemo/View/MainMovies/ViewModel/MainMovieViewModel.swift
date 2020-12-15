//
//  MainMovieViewModel.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation

class MainMovieViewModel {
    weak var dataSource : GenericDataSource<Movie>?
    weak var movieNetworkService: MovieNetworkService?
    var errorMsg = MutableLiveData<String>("")
    
    init(movieNetworkService: MovieNetworkService = MovieNetworkService.getInstance(), dataSource : GenericDataSource<Movie>?) {
        self.movieNetworkService = movieNetworkService
        self.dataSource = dataSource
        
    }
    
    func fetchMovies() -> Void {
        movieNetworkService?.fetchMovies({results in
            switch results {
                case .success(let moviesMutableData):
                    self.dataSource?.data.value = moviesMutableData!.value
                    break
                    
                case .error(let errMsg):
                    self.errorMsg.value = errMsg.localizedDescription
                    break
                
            }
            
        })
    }
}
