//Check for Duplicate with distance
//near by duplicate in array


class ContainsDuplicateII {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        
        var numToLastIndex = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if let lastIndex = numToLastIndex[num], i - lastIndex <= k {
                return true
            } else {
                numToLastIndex[num] = i
            }
        }
        
        return false
    }
}
