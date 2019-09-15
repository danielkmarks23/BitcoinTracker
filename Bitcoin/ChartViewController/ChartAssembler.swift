import Foundation

protocol ChartAssembling {
    
    func bitcoinChartViewController() -> ChartViewController
}

class ChartAssembler: ChartAssembling {
    
    func bitcoinChartViewController() -> ChartViewController {
        
        let dataStore = BitcoinChartDataStore()
        return chartViewController(dataStore: dataStore)
    }
    
    private func chartViewController(dataStore: ChartDataStoring? = nil) -> ChartViewController {
        
        let presenter = ChartPresenter()
        
        let coordinator = ChartCoordinator(presenter: presenter,
                                           dataStore: dataStore)
        let viewController = ChartViewController()
        viewController.coordinator = coordinator
        
        return viewController
    }
}
