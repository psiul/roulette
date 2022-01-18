select count(ss.ss_item_sk)
from store_sales ss,date_dim d
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 148 and ss.ss_hash <= 348 and d.d_hash >= 440 and d.d_hash <= 940
;
