//
//  File.swift
//  
//
//  Created by Виктория Федосова on 24.05.2023.
//

import Vapor
import Fluent

final class User: Model, Content {
    static let schema: String = "users"
    
    @ID var id: UUID?
    
    @Field(key: "user_login") var login: String
    @Field(key: "user_password") var password: String
    @Field(key: "user_status") var status: Int
}


 
