select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 553 and ss.ss_hash <= 886 and d.d_hash >= 68 and d.d_hash <= 818 and i.i_hash >= 470 and i.i_hash <= 870
;
