select count(ss.ss_item_sk)
from store_sales ss,date_dim d
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 759 and ss.ss_hash <= 959 and d.d_hash >= 450 and d.d_hash <= 950
;
