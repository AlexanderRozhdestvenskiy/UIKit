import UIKit

// MARK: Networking

/*
 - Клиент-серверное общение
 - HTTP и REST
 - Данные и сериализация JSON + Codable
 - Инструменты Networking'а в iOS
 - Авторизация
 - Bonus: безопасный Networking
 */

// 1. Клиент-серверное общение. Зачем? Два и более устройства хотят общаться (мессенджер), хотим запоминать данные пользователя даже если он удалил приложение (отправлять данные на сервер), хотим чтобы приложение "весило" мало на момент загрузки из AppStore (видео на сервере), некоторым приложениям вообще не нужен (редко, небольшие игры)


// Типы клиент-серверного общения

/*
 REST - отправляем запросы, получаем ответы
 WebSocket - открываем соединение, общаемся с сервером сообщениями
 */

// 2. Основы HTTP и REST

/*
 HTTP(S) - сетевой протокол передачи данных, S - secure
 Тип запроса - GET/POST/
 
 REST - стиль архитектуры ПО, использующийся для построения веб-служб
 Еденица информации - URL как ресурс, HTTP-глагол есть действие
 HTTP-статусы для указания типв ошибки
 
 Ошибки выполнения запроса - ошибка сервиса / нет сети / ошибка данных
 Retry - повтор запроса по определенной логике пока он не выполнится
 */

// 3. Данные и сериализация

/*
 Какие форматы данных бывают? JSON, XML, HTML
 
 Де/Сериализация - перевод информации между данными и моделями языка
 Codable = Decodable (JSON -> Swift) + Encodable (Swift -> JSON)
 */

{
    "query": "ios",
    "limit": 20
}

struct Query {
    let query: String
    let limit: Int
}

struct Product: Codable {
    var title: String
    var price: Double
    var quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case price = "decimal_price"
        case quantity = "count"
    }
}

let bonus: URL = "https://www.quicktype.io"

// Инструменты

/*
 URLSession - сессия через которую ведется работа с сетью,
 умеет создавать задачи на выполнение запросов
 
 URLRequest - сущность с информацией о запросе
 
 URLSessionDataTask - сущность "задачи на выполнение запроса"
 
 URLResponse - сущность "информации ответа на запрос"
 
 */

let session = URLSession(configuration: .default)
var urlRequest = URLRequest(url: bonus)
urlRequest.httpMethod = "POST"

let task = session.dataTask(with: urlRequest) { data, response, error in
    
    if let error = error {
        // code
    }
    
    if let response = response as? HTTPURLResponse {
        // code
    }
    
    if let data = data {
        // code
    }
}
task.resume()



