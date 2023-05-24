import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.get("lessions", ":id") { req -> EventLoopFuture<SwiftDoc> in
        SwiftDoc.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    try app.register(collection: TodoController())
    try app.register(collection: UsersController())
}
