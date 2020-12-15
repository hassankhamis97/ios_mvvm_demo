//
//  MutableLiveData.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import Foundation

class MutableLiveData<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    var value: T {
        didSet {
            self.notify()
        }
    }
    
    var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    private func addObserver(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.observers[observer.description] = completionHandler
    }
    
    public func observe(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer: observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() -> Void {
        observers.forEach { $0.value(value) }
    }
    
    deinit {
        observers.removeAll()
    }}
