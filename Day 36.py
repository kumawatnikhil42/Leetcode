class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        if numRows==0:
            return([])
        l=[[1]]
        for j in range(1,numRows):
            p=l[-1]
            n=[1]+[p[i]+p[i+1] for i in range(len(p)-1)]+[1]
            l.append(n) 
        return l
