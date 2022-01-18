select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 374 and ss.ss_hash <= 707 and d.d_hash >= 301 and d.d_hash <= 701 and i.i_hash >= 224 and i.i_hash <= 974
;
