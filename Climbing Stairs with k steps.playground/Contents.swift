import UIKit
import XCTest
/*
 Climbing Stairs with k steps
 
 You have stair case with n steps, you can take upto k steps to climb them.
 In how many distinct ways you can climb to the top?
 
 Framework for solving DP problems:
 Step 1. Define objective function.
 f(n) is the number of distinct steps to reach the n'th stair by taking upto k steps.
 
 Step 2. Identify base cases.
 f(0) = 1
 f(1) = 1
 f(2) = 2
 f(k) = n
 
 Step 3. Write down the recurrance relation for optimised objective function.
 f(n) = f(n-1) + f(n-2) + f(n-3) + ...  + f(n-k)
 
 Step 4. What's the order of execution/computation?
 Bottom-up
 
 Step 5. Where to look for the answer?
 f(n)
 */

class Solution {
    // Time Complexity: O(nk)
    // Space Complexity: O(n)
    func climbingStairs(_ n: Int, _ k: Int) -> Int {
        var dp: [Int] = []
        dp.append(1) // f[0] = 1
        dp.append(1) // f[1] = 1
        for i in 2..<n+1 {
            var sum = 0
            for j in 1..<k+1 {
                if i-j >= 0 {
                    sum += dp[i-j] // Recurrance relation
                }
            }
            dp.append(sum)
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
        let output = 13
        let result = solution.climbingStairs(arg, 3)
        XCTAssertEqual(output, result)
    }
    
    func test2() {
        let arg = 6
        let output = 31
        let result = solution.climbingStairs(arg, 5)
        XCTAssertEqual(output, result)
    }
    
    func test3() {
        let arg = 7
        let output = 56
        let result = solution.climbingStairs(arg, 4)
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
