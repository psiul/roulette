select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 422 and ss.ss_hash <= 755 and i.i_hash >= 120 and i.i_hash <= 520 and d.d_hash >= 171 and d.d_hash <= 921
;
