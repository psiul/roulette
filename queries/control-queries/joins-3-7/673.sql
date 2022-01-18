select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 66 and ss.ss_hash <= 399 and i.i_hash >= 213 and i.i_hash <= 963 and d.d_hash >= 375 and d.d_hash <= 775
;
