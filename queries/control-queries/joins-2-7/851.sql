select count(ss.ss_item_sk)
from store_sales ss,date_dim d
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 83 and ss.ss_hash <= 583 and d.d_hash >= 753 and d.d_hash <= 953
;
