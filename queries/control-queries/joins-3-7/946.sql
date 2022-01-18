select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 514 and ss.ss_hash <= 847 and d.d_hash >= 150 and d.d_hash <= 550 and i.i_hash >= 136 and i.i_hash <= 886
;
