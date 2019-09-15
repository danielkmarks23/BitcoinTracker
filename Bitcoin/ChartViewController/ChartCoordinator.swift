import UIKit

protocol ChartCoordinating {
    
    func viewControllerViewDidLoad(viewController: UIViewController)
}

class ChartCoordinator: ChartCoordinating {
    
    weak var viewController: ChartViewController?
    let presenter: ChartPresenting
    let dataStore: ChartDataStoring?
    
    required init(presenter: ChartPresenting,
                  dataStore: ChartDataStoring?) {
        
        self.presenter = presenter
        self.dataStore = dataStore

        configureOnInit()
    }
    
    private func configureOnInit() {
    }
    
    private func load() {
        
        dataStore?.load({ [unowned self] rates in
            DispatchQueue.main.async {
                self.presenter.presentData(data: rates)
            }
        }, catchError: { error in
                print(error)
        })
    }
    
    private func configureOnViewLoad(chartViewController: ChartViewController) {
        
        self.viewController = chartViewController
        
        presenter.configureOnViewLoad(chartViewController)
        
        load()
    }
    
    func viewControllerViewDidLoad(viewController: UIViewController) {
        
        guard let chartViewController = viewController as? ChartViewController else {
            fatalError("ChartCoordinator can only coordinate ChartViewController")
        }
        
        configureOnViewLoad(chartViewController: chartViewController)
    }
}
