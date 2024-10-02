class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        c=0
        for i in words:
            v=True
            temp=chars
            for j in i:
                if j not in temp:
                    v=False
                    break
                temp=temp.replace(j,"",1)
            if v:
                c+=len(i)
        return c
        
         
