select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 85 and ss.ss_hash <= 835 and i.i_hash >= 313 and i.i_hash <= 646 and d.d_hash >= 154 and d.d_hash <= 554
;
