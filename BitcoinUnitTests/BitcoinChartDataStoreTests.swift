import XCTest
@testable import Bitcoin


// TODO: This should be tested towards a mock server
class BitcoinChartDataStoreTests: XCTestCase {

    var dataStore: BitcoinChartDataStore!
    
    override func setUp() {
        
        super.setUp()
        
        dataStore = BitcoinChartDataStore()
    }

    func test_GivenDataStore_WhenDataLoaded_ThenDataIsCorrect() {

        let expectation = XCTestExpectation(description: "rates correct")
        
        dataStore.load({ rates in
            
            XCTAssertEqual(rates.description, "Average USD market price across major bitcoin exchanges.")
            XCTAssertEqual(rates.unit, "USD")
            XCTAssertEqual(rates.values.count, 21)
            
            let rate0 = rates.values[0]["y"]
            
            XCTAssertEqual(rate0, 8342.24076923077)
            
            expectation.fulfill()
            
        }, catchError: { error in
            
        })
        
        wait(for: [expectation], timeout: 1)
    }
}
