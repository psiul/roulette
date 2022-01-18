select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 94 and ss.ss_hash <= 494 and i.i_hash >= 355 and i.i_hash <= 688 and d.d_hash >= 179 and d.d_hash <= 929
;
