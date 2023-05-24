//
//  File.swift
//  
//
//  Created by Виктория Федосова on 11.05.2023.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateSwiftDoc: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("SwiftLessons")
            .id()
            .field("lession", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("SwiftLessons").delete()
    }
    
}
