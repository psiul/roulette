select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 33 and ss.ss_hash <= 783 and d.d_hash >= 257 and d.d_hash <= 657 and i.i_hash >= 636 and i.i_hash <= 969
;
