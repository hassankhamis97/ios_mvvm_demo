//
//  GenericDataSource.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation


class GenericDataSource<T> : NSObject {
    var data: MutableLiveData<[T]> = MutableLiveData([])
}
