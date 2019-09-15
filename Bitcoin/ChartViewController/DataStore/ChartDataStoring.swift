import Foundation

protocol ChartDataStoring {

    func load(_ completion: @escaping ((ExchangeRates) -> Void), catchError errorHandling: @escaping (Error) -> Void)
}
