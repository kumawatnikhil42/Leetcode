class Solution:
    def dayOfYear(self, date: str) -> int:
        year,month,day=map(int,date.split("-"))
        days=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        if (year%4==0 and year%100!=0) or (year%400==0):
            days[1]=29
        n=0
        for i in range(month-1):
            n+=days[i]
        n+=day
        return n
