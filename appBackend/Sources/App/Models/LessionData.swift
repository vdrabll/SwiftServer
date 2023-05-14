//
//  File.swift
//  
//
//  Created by Виктория Федосова on 14.05.2023.
//

import Foundation
import Vapor
import Fluent

struct LessionData: Content {
    let id: UUID
    let name: String
    let data: String
    
}
