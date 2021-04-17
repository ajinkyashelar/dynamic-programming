import UIKit
import XCTest
/*
 Climbing Stairs
 
 You have stair case with n steps, you can take 1 or 2 steps to climb them.
 In how many distinct ways you can climb to the top?
 
 Framework for solving DP problems:
 Step 1. Define objective function.
 f(n) is the number of distinct steps to reach the n'th stair.
 
 Step 2. Identify base cases.
 f(0) = 1
 f(1) = 1
 f(2) = 2
 
 Step 3. Write down the recurrance relation for optimised objective function.
 f(n) = f(n-1) + f(n-2)
 
 Step 4. What's the order of execution/computation?
 Bottom-up
 
 Step 5. Where to look for the answer?
 f(n)
 */
// Time Complexity: O(n)
// Space Complexity: O(n)
class Solution {
    func climbingStairs(_ n: Int) -> Int {
        var dp: [Int] = []
        dp.append(1) // f[0] = 1
        dp.append(1) // f[1] = 1
        for i in 2..<n+1 {
            dp.append(dp[i-1] + dp[i-2]) // Recurrance relation
        }
        return dp[n] // Final value in the array.
    }
}

class SolutionTests: XCTestCase {
    var solution: Solution!
    override func setUp() {
        super.setUp()
        solution = Solution()
    }
    
    func test1() {
        let arg = 5
        let output = 8
        let result = solution.climbingStairs(arg)
        XCTAssertEqual(output, result)
    }
    
    func test2() {
        let arg = 6
        let output = 13
        let result = solution.climbingStairs(arg)
        XCTAssertEqual(output, result)
    }
    
    func test3() {
        let arg = 7
        let output = 21
        let result = solution.climbingStairs(arg)
        XCTAssertEqual(output, result)
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
SolutionTests.defaultTestSuite.run()
