/**SQL Task I
Output of all facts SalesQty, SalesPrice (from FactSales), which are located in the month "January 2019".
To do this, output DateKey (from DimDate), WareGroupKey (from DimProduct) and StoreDescription (from DimStore).
Sorting by DateID, WareGroupKey
Result columns: DateKey, WareGroupKey, StoreDescription, SalesQty, SalesPrice**/

Use NewYorkers;
select d.DateKey, p.WareGroupKey, s.StoreDescription, f.SalesQty, f.SalesPrice 
from factsales f 
join dimDate d ON d.DateID = f.SalesDateID
join Dimproduct p ON p.ProductID = f.ProductID
join dimstore s on s.StoreID = f.StoreID 
where month(DateKey)= '01' AND Year(DateKey) = '2019'
Order by d.DateID, p.WareGroupKey;

/**TASK 2:Output of the sum of SalesQty * SalesPrice(as new column SalesValueSum)
and the average item sales price (as a new column SalesPriceAvg),
per month (MonthID) and store (StoreKey) only for the year 2019 and active stores.
Sort by StoreKey, MonthID
Result Columns: StoreKey, MonthID, SalesValueSum (calculated new column), SalesPriceAvg (calculated new column)
Note: The SalesQty column can contain NULL values**/

select s.StoreKey, MonthID, sum(f.SalesQty*f.SalesPrice) as SalesValueSum, avg(f.salesprice) as SalesPriceAvg 
from  factsales f
JOIN  DimStore s ON s.StoreID = f.StoreID
join dimdate d ON d.DateID = f.SalesDateID
where Year(d.DateKey) = 2019 AND s.isActiveStore = 1
group by d.MonthID, s.StoreKey
Order by s.StoreKey, d.MonthID;

/**TASK 3: Output of the sum of SalesQty (as a new column SalesQtySum) 
and the cumulative sum of SalesQty (as a new column SalesQtyCum),
per day (DateKey) and Store (StoreKey) only for the month "January 2019".
Sort by StoreKey, DateID
Result columns: StoreKey, DateKey, SalesQtySum (calculated new column), SalesQtyCum (calculated new column)
Note: The SalesQty column can contain NULL values**/

select s.storeKey, d.Datekey, sum(f.SalesQty) as SalesQtySum, 
(select sum(SalesQty) 
from Factsales f2 
where f2.salesID<=f.salesID) as SalesQtyCum
from Factsales f 
JOIN Dimstore s ON s.StoreID = f.StoreID
JOIN Dimdate d ON  f.salesDateID = d.dateID
where month(DateKey)= '01' AND Year(DateKey)= 2019
group by s.StoreKey, d.Datekey
order by s.StoreKey, d.dateID;


