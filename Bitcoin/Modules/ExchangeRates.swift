import Foundation

struct ExchangeRates: Codable {
    
    var unit: String
    var description: String
    var values: [Dictionary<String, Double>]
}
