select count(ss.ss_item_sk)
from store_sales ss,date_dim d
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 667 and ss.ss_hash <= 867 and d.d_hash >= 166 and d.d_hash <= 666
;
