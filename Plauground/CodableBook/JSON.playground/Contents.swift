import Foundation

struct Plane: Codable {
    let manufacturer: String
    let model: String
    let seats: Int
    
    private enum CodingKeys: String, CodingKey {
        case manufacturer = "manufacturer_x"
        case model
        case seats
    }
}

// MARK: JSON одиночный

let jsonOne = """
{
    "manufacturer_x": "Cessna",
    "model": "172 Skyhawk",
    "seats": 4,
}
"""

let data = jsonOne.data(using: .utf8)!
let decoder = JSONDecoder()
let plane = try decoder.decode(Plane.self, from: data)

print(plane.manufacturer)
print(plane.model)
print(plane.seats)

let encoder = JSONEncoder()
let reencodedJSON = try encoder.encode(plane)

print(String(data: reencodedJSON, encoding: .utf8)!)

// MARK: JSON массив

let jsonTwo = """
[
    {
        "manufacturer_x": "Cessna",
        "model": "172 Skyhawk",
        "seats": 4,
    },
    {
        "manufacturer_x": "Piper",
        "model": "PA-28 Cherokee",
        "seats": 4,
    }
]
"""

let dataJSON = jsonTwo.data(using: .utf8)!
let planes = try decoder.decode([Plane].self, from: dataJSON)

// MARK: JSON как словарь

let jsonThree = """
{
    "planes": [
        {
            "manufacturer_x": "Cessna",
            "model": "172 Skyhawk",
            "seats": 4,
        },
        {
            "manufacturer_x": "Piper",
            "model": "PA-28 Cherokee",
            "seats": 4,
        }
    ]
}
"""

let data3 = jsonThree.data(using: .utf8)!
let keyedPlanes = try decoder.decode([String: [Plane]].self, from: data3)
let planesTwo = keyedPlanes["planes"]

struct Fleet: Decodable {
    var planes: [Plane]
}

let fleet = try decoder.decode(Fleet.self, from: data3)
let planes3 = fleet.planes
