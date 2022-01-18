select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 316 and ss.ss_hash <= 649 and i.i_hash >= 202 and i.i_hash <= 952 and d.d_hash >= 266 and d.d_hash <= 666
;
