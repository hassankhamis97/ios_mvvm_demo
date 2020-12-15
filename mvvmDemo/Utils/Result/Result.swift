//
//  Result.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation

enum Result<T,E: Error> {
    case success(T)
    case error(E)
}
