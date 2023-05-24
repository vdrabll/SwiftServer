import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {

    app.databases.use(.postgres(configuration: .init(hostname: "localhost",
                                                     port: 5432, username: "postgres",
                                                     password: "",
                                                     database: "swiftdocsdb")), as: .psql)
    
    app.migrations.add(CreateSwiftDoc())
    app.migrations.add(CreateUser())
    app.views.use(.leaf)
    try routes(app)
}
