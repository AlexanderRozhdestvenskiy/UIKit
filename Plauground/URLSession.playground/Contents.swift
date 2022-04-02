import UIKit

// HTTP методы:

// GET - чтение
// PUT - создание
// POST - изменение
// DELETE - удаление

    // MARK: - GET

struct SpaceInfo: Codable {
    let message: String
    let number: Int
    let people: [Person]
    
    struct Person: Codable {
        let craft: String
        let name: String
    }
}

func load() {
    
    guard let url = URL(string: "http://api.open-notify.org/astros.json") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print(error?.localizedDescription ?? "No")
            return
        }
        guard let data = data else {
            return
        }
        
        guard let spaceInfo = try? JSONDecoder().decode(SpaceInfo.self, from: data) else {
            print("Error: can't parse SpaceInfo")
            return
        }
        
        print("\(spaceInfo.number)")
    }
    task.resume()
}

load()

    // MARK: - POST

func request() {
    
    guard let url = URL(string: "https://reqres.in/api/cupcakes") else { return }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard let data = data else { return }
        print(data)
    }
    .resume()
}

    // MARK: - URLSession, URLRequest, URLSessionTask

