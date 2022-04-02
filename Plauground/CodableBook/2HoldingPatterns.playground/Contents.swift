import UIKit

var json = """
{
    "aircraft": {
        "identification": "NA12345",
        "color": "Blue/White"
    },
    "route": ["KTTD", "KHIO"],
    "flight_rules": "VFR",
    "departure_time": {
        "proposed": "2018-04-20T14:15:00-07:00",
        "actual": "2018-04-20T14:20:00-07:00"
    },
    "remarks": null
}
"""

struct Aircraft: Decodable {
    var identification: String
    var color: String
}

enum FlightRules: String, Decodable {
    case visual = "VFR"
    case instrument = "IFR"
}

var decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

struct FlightPlan: Decodable {
    var aircraft: Aircraft
    var route: [String]
    var flightRules: FlightRules
    
    private var departureDates: [String: Date]
    var proposedDepartureDate: Date? {
        return departureDates["proposed"]
    }
    var actualDepartureDate: Date? {
        return departureDates["actual"]
    }
    
    var remarks: String?

}

extension FlightPlan {
    enum CodingKeys: String, CodingKey {
        case aircraft
        case flightRules = "flight_rules"
        case route
        case departureDates = "departure_time"
        case remarks
    }
}

let data = json.data(using: .utf8)!

let plan = try! decoder.decode(FlightPlan.self, from: data)
print(plan.aircraft.identification)
