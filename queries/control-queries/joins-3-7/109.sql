select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 42 and ss.ss_hash <= 792 and i.i_hash >= 319 and i.i_hash <= 719 and d.d_hash >= 312 and d.d_hash <= 645
;
