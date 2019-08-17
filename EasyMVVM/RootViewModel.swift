//
//  RootViewModel.swift
//  EasyMVVM
//
//  Created by Lukáš Spurný on 10/08/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

protocol RootViewModelDelegate{
//    MARK: calling  didStartFetchingMessage func from RootViewController
    func didStartFetchingMessage(_ message:String?)
//    MARK: calling  didFinishFetchingMessage func from RootViewController
    func didFinishFetchingMessage(_ message:String?)
}

class RootViewModel{
    
    var rootViewModelDelegate:RootViewModelDelegate?
    
//    tady si skrátka nachystáš modely ktery budeš potřebovat ve viewcontrolleru , i když sis je mohl všechny volat ve view controller zvlást, ale timhle stzačí aby sis ve viewcontroller zavolal jen viewmodel
    
    let user: User
    
    init(user:User){
        self.user = user
    }
    
    func fetchMessage(){
//        MARK: calling rootViewModelDelegate next didStartFetchingMessage
        rootViewModelDelegate?.didStartFetchingMessage("Fetching...")
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { timer in
            print("go to fire one func")
            
            var message:String? = "hello there"
            if message == nil {
                message = "Faild to fetching message from server"
            }
            
            //MARK: calling rootViewModelDelegate next didFinishFetchingMessage
            self.rootViewModelDelegate?.didFinishFetchingMessage(message)
            
        })
    }
    
    
//    private var _user: User
//
//    var user:User{
//        get{
//            return _user
//        }
//        set{
//            _user = newValue
//        }
//    }
//
//    init(user:User){
//        self._user = user
//    }

}
