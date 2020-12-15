//
//  ErrorResult.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation
enum ErrorResult: Error {
    case network(_ desc: String)
    case custom(_ desc: String)
}

enum ErrorReason: String {
    case noInternetConnection = "No internet connection"
    case genericReason = "An error occured please try again later!"
}
