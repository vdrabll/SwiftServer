//
//  File.swift
//  
//
//  Created by Виктория Федосова on 24.05.2023.
//

import Vapor
import Fluent

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("user_login", .string, .required)
            .field("user_password", .string, .required)
            .field("user_status", .int, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("SwiftLessons").delete()
    }
    
}
