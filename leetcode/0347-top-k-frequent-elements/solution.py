class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:

        group={}
        result=[]
        list_new = [[] for _ in range(len(nums) + 1)]        
        for i in nums:
            if i not in group:
                group[i]=1
            else:
                group[i]+=1

        for i,j in group.items():
            list_new[j].append(i)
        print(list_new)

        for i in range(len(list_new) - 1, -1, -1):
            for num in list_new[i]:
                result.append(num)
                if len(result)==k:
                    return result


        
