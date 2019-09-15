import Foundation

final class BitcoinChartDataStore: ChartDataStoring {
    
    func load(_ completion: @escaping ((ExchangeRates) -> Void), catchError errorHandling: @escaping (Error) -> Void) {
        
        guard let url = URL(string: "https://api.blockchain.info/charts/market-price?timespan=3weeks&format=json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(ExchangeRates.self, from: data)
                completion(data)
                
            } catch let error {
                errorHandling(error)
            }
        }.resume()
    }
}
