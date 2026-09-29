class Solution:
    def containsDuplicate(self, nums: list[int]) -> bool:

        result={}
        for i in nums:
            if i not in result:
                result[i]=1
            else:
                result[i]+=1
                if result[i]>1:
                    return True
                    
        return False
