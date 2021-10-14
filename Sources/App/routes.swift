import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let routerGrouped = app.grouped("main", "home")
    
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    };app.get { req in
        return "It works!"
    }
    
    app.get("hello", ":name", ":age") { req -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.badRequest)
        }
        guard let age = req.parameters.get("age", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "My name is \(name) and \(age) years old."
    }
    

    // http://127.0.0.1:8080/abcで文字列を返す
    app.get("abc") { req in
        return "こんにちは"
    }
    
    routerGrouped.get("info") { req in
        return "Infomation"
    }
 
  
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
}
