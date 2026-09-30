class Solution:
    def groupAnagrams(self, strs: list[str]) -> list[list[str]]:
        group = {}
        result=[]

        for i in strs:
            j = "".join(sorted(i))

            if j not in group:
                group[j] = []

            group[j].append(i)


        for i in group.values():
            result.append(i)
        return result
