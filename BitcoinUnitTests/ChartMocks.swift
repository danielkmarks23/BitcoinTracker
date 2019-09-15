import Charts
@testable import Bitcoin

class MockChartAssembler: ChartAssembling {
    
    var bitcoinChartViewControllerToReturn = ChartViewController()
    
    func bitcoinChartViewController() -> ChartViewController {
        bitcoinChartViewControllerToReturn.coordinator = MockChartCoordinator()
        return bitcoinChartViewControllerToReturn
    }
}

class MockChartViewController: UIViewController, ChartViewControllerProtocol {
    
    var chart: LineChartView! = LineChartView()
    var infoLabel: UILabel! = UILabel()
}

class MockChartCoordinator: ChartCoordinating {
    
    var receivedViewController: UIViewController?
    var viewWillAppear: Bool = false
    
    func viewControllerViewDidLoad(viewController: UIViewController) {
        
        receivedViewController = viewController
    }
    
    func viewControllerViewWillAppear() {
        
        viewWillAppear = true
    }
}

class MockChartPresenter: ChartPresenting {
    
    var receivedChartViewController: UIViewController?
    var receivedData: ExchangeRates!
    
    func configureOnViewLoad(_ chartViewController: UIViewController & ChartViewControllerProtocol) {
        receivedChartViewController = chartViewController
    }
    
    func presentData(data: ExchangeRates) {
        
        receivedData = data
    }
}

class MockChartDataStore: ChartDataStoring {
    
    var loadRequested = false
    
    func load(_ completion: @escaping ((ExchangeRates) -> Void), catchError errorHandling: @escaping (Error) -> Void) {
        
        loadRequested = true
        let data = ExchangeRates(unit: "GBP", description: "GBP Rates", values: [["x":1561680000,"y":11665.575833333334], ["x":1561766400,"y":11886.886153846155], ["x":1561852800,"y":11545.633333333331]])
        
        completion(data)
    }
}
