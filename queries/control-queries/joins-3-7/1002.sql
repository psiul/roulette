select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 341 and ss.ss_hash <= 741 and d.d_hash >= 233 and d.d_hash <= 983 and i.i_hash >= 36 and i.i_hash <= 369
;
