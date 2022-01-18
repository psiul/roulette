select count(ss.ss_item_sk)
from store_sales ss,date_dim d
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 12 and ss.ss_hash <= 512 and d.d_hash >= 714 and d.d_hash <= 914
;
