//
//  Animal.swift
//  Quiz21
//
//  Created by mars on 2021/10/30.
//

struct Animal {
    var name : String
    var kind : String
    var fly : Bool
    var image : String
    
    init(name: String, kind: String, fly: Bool, image: String){
        self.name = name
        self.kind = kind
        self.fly = fly
        self.image = image
    }
}
