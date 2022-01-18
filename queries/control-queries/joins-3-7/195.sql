select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 65 and ss.ss_hash <= 815 and d.d_hash >= 115 and d.d_hash <= 515 and i.i_hash >= 206 and i.i_hash <= 539
;
