import XCTest
@testable import Bitcoin

class ChartViewControllerTests: XCTestCase {
    
    var viewController: ChartViewController!
    var mockCoordinator: MockChartCoordinator!
    
    override func setUp() {
        
        super.setUp()
        
        mockCoordinator = MockChartCoordinator()
        viewController = ChartViewController()
        viewController.coordinator = mockCoordinator
    }
    
    func test_GivenViewController_WhenViewLoaded_ThenNotifysCoordinator() {
        
        viewController.viewDidLoad()
        XCTAssertEqual(mockCoordinator.receivedViewController, viewController)
    }
}

