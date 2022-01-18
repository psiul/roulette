select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 447 and ss.ss_hash <= 847 and i.i_hash >= 131 and i.i_hash <= 881 and d.d_hash >= 346 and d.d_hash <= 679
;
