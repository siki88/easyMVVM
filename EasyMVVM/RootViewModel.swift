//
//  RootViewModel.swift
//  EasyMVVM
//
//  Created by Lukáš Spurný on 10/08/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

class RootViewModel{
    
    
//    tady si skrátka nachystáš modely ktery budeš potřebovat ve viewcontrolleru , i když sis je mohl všechny volat ve view controller zvlást, ale timhle stzačí aby sis ve viewcontroller zavolal jen viewmodel
    
    let user: User
    
    init(user:User){
        self.user = user
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
