select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 171 and ss.ss_hash <= 921 and i.i_hash >= 81 and i.i_hash <= 481 and d.d_hash >= 223 and d.d_hash <= 556
;
