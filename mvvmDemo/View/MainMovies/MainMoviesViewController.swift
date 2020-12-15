//
//  MainMoviesViewController.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import UIKit

class MainMoviesViewController: UIViewController {

    let movieDataSource = MovieDataSource()
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBOutlet weak var movieTableView: UITableView!
    lazy var viewModel : MainMovieViewModel = {
        let viewModel = MainMovieViewModel(dataSource: movieDataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.isHidden = false
        movieTableView.dataSource = movieDataSource
        self.movieDataSource.data.observe(observer: self) { [weak self] movies in
            if movies.count > 0 {
                self?.loader.isHidden = true
                self?.movieTableView.reloadData()
            }
        }
        
        viewModel.errorMsg.observe(observer: self, completionHandler: { (err) in
            print(err)
        })
        
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        viewModel.fetchMovies()
    }

}
