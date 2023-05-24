import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("first", "Intro") { req -> String in
        return "Привет! В этом уроке мы познакомимся с основами языка Swift"
    }
    
    app.post("info") { req -> InfoResponse in
      let data = try req.content.decode(InfoData.self)
      // 2
      return InfoResponse(request: data)
    }
    
    app.get("lessions", ":id") { req -> EventLoopFuture<SwiftDoc> in
        SwiftDoc.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    try app.register(collection: TodoController())
}

struct InfoData: Content {
 let name: String
}

struct InfoResponse: Content {
  let request: InfoData
}
