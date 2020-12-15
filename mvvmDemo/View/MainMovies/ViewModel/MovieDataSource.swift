//
//  MovieDataSource.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation
import UIKit

class MovieDataSource: GenericDataSource<Movie>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        cell.movieTitle_lbl.text = self.data.value[indexPath.row].title
        cell.releaseDate_lbl.text = self.data.value[indexPath.row].releaseDate
        
        return cell
    }
    
    
    
}
