import XCTest
@testable import Bitcoin

class ChartPresenterTests: XCTestCase {
    
    var presenter: ChartPresenter!
    var viewController: ChartViewController!
    
    override func setUp() {
        
        super.setUp()
        
        presenter = ChartPresenter()
        viewController = ChartViewController()
        viewController.coordinator = MockChartCoordinator()
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func test_GivenPresenter_WhenViewLoaded_ViewsConfiguredCorrectly() {
        
        presenter.configureOnViewLoad(viewController)
        
        XCTAssertEqual(viewController.view.backgroundColor, .white)
        XCTAssertEqual(viewController.chart.noDataText, "No Data")
        
        XCTAssertEqual(viewController.infoLabel.text, "Info")
        XCTAssertEqual(viewController.infoLabel.textAlignment, .center)
        XCTAssertEqual(viewController.infoLabel.numberOfLines, 2)
    }
    
    func test_GivenPresenter_WhenPresentDataCalled_ThenDataIsPresented() {
        
        presenter.configureOnViewLoad(viewController)
        let data = ExchangeRates(unit: "GBP", description: "GBP Rates", values: [["x":1561680000,"y":11665.575833333334], ["x":1561766400,"y":11886.886153846155], ["x":1561852800,"y":11545.633333333331]])
        presenter.presentData(data: data)
        
        XCTAssertEqual(viewController.infoLabel.text, "GBP Rates")
        XCTAssertNotNil(viewController.chart.lineData)
    }
}

class DateNameFormatterTests: XCTestCase {
    
    var formatter: DateNameFormater!
    
    override func setUp() {
        
        super.setUp()
        
        formatter = DateNameFormater()
    }
    
    func test_GivenValue_StringIsCorrect() {
        
        let date = formatter.stringForValue(1562330820, axis: nil)
        XCTAssertEqual(date, "05/07")
    }
}
