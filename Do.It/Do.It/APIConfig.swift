//
//  apiConfiguration.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 21/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import Foundation

struct AllTodo: Decodable {
    let todo : [Todo]
}

struct Todo: Decodable, Encodable {
    let id: Int?
    let title: String

    init(title: String) {
        self.id = nil
        self.title = title
    }
}

struct APIConfig {

    static func readAllTodos(retornoAssíncrono: @escaping([Todo]) -> Void) {

        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 8080
        components.path = "/todos"

        guard let url = components.url else {
            retornoAssíncrono([])
            return
        }

        let session = URLSession(configuration: .default)

        let todoTask = session.dataTask(with: url) {( data, response, error) in
            print("Retorno da requisição")

            if let data = data {
                if let todoList = try? JSONDecoder().decode([Todo].self, from: data) {
                        retornoAssíncrono(todoList)
                } else {
                    print("deu ruim, meu parsa")
                    retornoAssíncrono([])
                    
                }
        }
    }
        print("morreu")
        
        todoTask.resume()
    }

    static func createTodo(todo: Todo, retornoAssíncrono: @escaping(Result<Todo,Error>) -> Void) {
        var createComponents = URLComponents()
        createComponents.scheme = "http"
        createComponents.host = "localhost"
        createComponents.port = 8080
        createComponents.path = "/todos"

        guard let url = createComponents.url else {
            retornoAssíncrono(Result.failure(TodoError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        if let data = try? JSONEncoder().encode(todo) {
                urlRequest.httpBody = data
        }
        
        urlRequest.allHTTPHeaderFields = ["Content-Type":"application/json"]
        
        let session = URLSession(configuration: .default)

        let todoTask = session.dataTask(with: url) {( data, response, error) in
            
            if let _ = error {
                retornoAssíncrono(.failure(TodoError.failedRequest))
            }
            
            if let data = data {
                if let todo = try? JSONDecoder().decode(Todo.self, from: data) {
                    retornoAssíncrono(.success(todo))
                } else {
                    print("deu ruim, meu parsa")
                    retornoAssíncrono(Result.failure(TodoError.failedRequest))
                    
                }
            }
        }
        print("morreu")
        
        todoTask.resume()
    }
    
    static func deleteTodo(id: Int, retornoAssíncrono: @escaping(Result<Int,TodoError>) -> Void) {
        var deleteComponents = URLComponents()
        deleteComponents.scheme = "http"
        deleteComponents.host = "localhost"
        deleteComponents.port = 8080
        deleteComponents.path = "/todos\(id)"

        guard let url = deleteComponents.url else {
            retornoAssíncrono(Result.failure(TodoError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        let session = URLSession(configuration: .default)

        let deleteTodoTask = session.dataTask(with: url) {( data, response, error) in
    
            if let _ = error {
                retornoAssíncrono(.failure(TodoError.failedRequest))
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    retornoAssíncrono(.success(id))
                default:
                    retornoAssíncrono(.failure(TodoError.unknownError(statusCode: response.statusCode)))
                }
            }
        }
        
        print("morreu")
        
        deleteTodoTask.resume()
    }

}
