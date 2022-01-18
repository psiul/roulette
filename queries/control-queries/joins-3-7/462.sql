select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 156 and ss.ss_hash <= 556 and i.i_hash >= 117 and i.i_hash <= 867 and d.d_hash >= 189 and d.d_hash <= 522
;
