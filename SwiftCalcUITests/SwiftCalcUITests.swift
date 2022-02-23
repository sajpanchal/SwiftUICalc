/// Copyright (c) 2022 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest

class SwiftCalcUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPressMemoryPlusAtAppStartShowZeroInDisplay() throws {
      
        let app = XCUIApplication()
        app.launch()
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        
        let display = app.staticTexts["display"]
        let displayText = display.label
        XCTAssert(displayText == "0")
    
    }
    
    func testAddingTwoDigits() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstButton = app.buttons["8"]
        firstButton.tap()
        
        let addButton = app.buttons["+"]
        addButton.tap()
        
        let secondButton = app.buttons["5"]
        secondButton.tap()
        
        let sumButton = app.buttons["="]
        sumButton.tap()
        
        let display = app.staticTexts["display"]
        
        let displayText = display.label
        
        XCTAssert(displayText == "13.0")
    }

    func testSwipeToClearMemory() throws {
        let app = XCUIApplication()
        
        app.launch()
        
        let numberButton = app.buttons["5"]
        numberButton.tap()
        
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        
        let display = app.staticTexts["memoryDisplay"]
        
        XCTAssert(display.exists)
#if !targetEnvironment(macCatalyst)
        display.swipeLeft()
#else
                display.doubleTap()
#endif
        
        XCTAssertFalse(display.exists)
    }

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
