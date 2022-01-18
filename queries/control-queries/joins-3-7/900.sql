select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 274 and ss.ss_hash <= 674 and i.i_hash >= 117 and i.i_hash <= 450 and d.d_hash >= 195 and d.d_hash <= 945
;
