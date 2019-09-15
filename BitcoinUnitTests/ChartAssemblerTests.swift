import XCTest
@testable import Bitcoin

class ChartAssemblerTests: XCTestCase {
    
    var chartAssembler: ChartAssembler!
    
    override func setUp() {
        
        super.setUp()
        
        chartAssembler = ChartAssembler()
    }
    
    func test_GivenAssembler_WhenBitcoinChartViewControllerAssembled_ThenRequestsCorrectConfig() {
        
        let viewController = chartAssembler.bitcoinChartViewController()
        XCTAssertNotNil(viewController)
    }
}
