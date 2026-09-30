class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s)!=len(t):
            return False

        res={}

        for i in s.strip():
            if i not in res:
                res[i]=1
            else:
                res[i]+=1
        
        for j in t.strip():
            if j not in res:
                return False
            else:
                res[j]-=1
        
        for i in res.values():
            if i>0:
                return False
        
        return True
