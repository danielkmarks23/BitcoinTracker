import XCTest
@testable import Bitcoin

class ChartCoordinatorTests: XCTestCase {
    
    var coordinator: ChartCoordinator!
    var viewController: ChartViewController!
    
    var mockDataStore: MockChartDataStore!
    var mockPresenter: MockChartPresenter!
    
    override func setUp() {
        super.setUp()
        
        mockDataStore = MockChartDataStore()
        mockPresenter = MockChartPresenter()
        coordinator = ChartCoordinator(presenter: mockPresenter, dataStore: mockDataStore)
        
        viewController = ChartViewController()
        viewController.coordinator = coordinator
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func test_GivenCoordinator_WhenViewLoaded_ThenPresenterConfiguredWithViewController() {
        
        XCTAssertNotNil(mockPresenter.receivedChartViewController)
        XCTAssertEqual(mockPresenter.receivedChartViewController, viewController)
    }
    
    func test_GivenCoordinator_WhenViewLoaded_ThenRequestsData_AndPresentsResults() {
        
        XCTAssertTrue(mockDataStore.loadRequested)
    }
}


