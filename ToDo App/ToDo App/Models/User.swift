//
//  User.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import Foundation

struct User : Codable{
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
