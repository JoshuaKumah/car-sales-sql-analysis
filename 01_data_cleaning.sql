select *
from car_prices;

select count(*)
from car_prices;

-- CHECKING ERRORS IN DATA
-- i found a way of correcting misplaced commas in csv file by using the server option import method. it helped in the standardization.

-- checking state, all looks well.
select state, count(*)
from car_prices
group by state;

-- checking the transmission column, hmm there are empty spaces : automatic, manual and ??.
SELECT *
FROM car_prices
WHERE transmission != 'automatic';

select distinct transmission, length(transmission)
from car_prices;
