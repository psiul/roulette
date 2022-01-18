select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 594 and ss.ss_hash <= 994 and d.d_hash >= 180 and d.d_hash <= 513 and i.i_hash >= 144 and i.i_hash <= 894
;
