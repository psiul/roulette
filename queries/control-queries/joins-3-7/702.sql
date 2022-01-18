select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 338 and ss.ss_hash <= 738 and i.i_hash >= 31 and i.i_hash <= 364 and d.d_hash >= 108 and d.d_hash <= 858
;
