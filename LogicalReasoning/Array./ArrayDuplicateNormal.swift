//Check if Array contains duplicates
//Simple way 
//using set

class ContainsDuplicate {
    func containsDuplicate(nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
}
//In simple way just filter or reduce to get instance of items and sort them and get the first item count if its greater than 1 then contains duplicate
