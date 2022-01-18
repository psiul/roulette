select count(ss.ss_item_sk)
from store_sales ss,date_dim d
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 398 and ss.ss_hash <= 898 and d.d_hash >= 224 and d.d_hash <= 424
;
