//
//  File.swift
//  
//
//  Created by Виктория Федосова on 10.05.2023.
//

import Foundation
import Fluent
import Vapor

final class SwiftDoc: Model, Content {

    static var schema =  "SwiftLessons" // name of databse
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "lession")
    var lession: String
    
    init() { }
    
    init(id: UUID? = nil, lession: String) {
        self.id = id
        self.lession = lession
    }
}

