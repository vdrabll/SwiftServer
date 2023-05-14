import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // запустить бд в докере
    // запускать сервер
    // примеры запросов
    app.get("first", "Intro") { req -> String in
        return "Привет! В этом уроке мы познакомимся с основами языка Swift"
    }
    
    app.post("info") { req -> InfoResponse in
      let data = try req.content.decode(InfoData.self)
      // 2
      return InfoResponse(request: data)
    }
    
    app.databases.use(.postgres(configuration: .init(hostname: "localhost",
                                                     port: 5432, username: "postgres",
                                                     password: "",
                                                     database: "swiftdocsdb")), as: .psql)
    
//    app.migrations.add(CreateSwiftDoc())
    app.get(<#T##PathComponent...#>) { <#Request#> in
        <#code#>
    }

    app.views.use(.leaf)


    // register routes
    try routes(app)
}
