//
//  User.swift
//  EasyMVVM
//
//  Created by Lukáš Spurný on 10/08/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

struct User {
    
    private var _name: String
    private var _age: Int
    private var _backgroundColor: UIColor
    
    var name:String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var age:Int{
        get{
            return _age
        }
        set{
            _age = newValue
        }
    }
    
    var backgroundColor:UIColor{
        get{
            return _backgroundColor
        }
        set{
            _backgroundColor = newValue
        }
    }
    
    
    init(name:String, age:Int, backgroundColor: UIColor) {
        self._name = name
        self._age = age
        self._backgroundColor = backgroundColor
    }
    
    init?(json:[String:Any]){
        if let name = json["name"], let age = json["age"], let backgroundColor = json["backgroundColor"]{
            self._name = name as! String
            self._age = age as! Int
            self._backgroundColor = backgroundColor as! UIColor
        }else{
            return nil
        }
    }
    
    
}
