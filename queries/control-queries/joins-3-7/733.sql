select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 418 and ss.ss_hash <= 818 and i.i_hash >= 120 and i.i_hash <= 870 and d.d_hash >= 93 and d.d_hash <= 426
;
