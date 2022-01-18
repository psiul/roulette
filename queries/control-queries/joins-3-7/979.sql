select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 22 and ss.ss_hash <= 772 and i.i_hash >= 469 and i.i_hash <= 802 and d.d_hash >= 599 and d.d_hash <= 999
;
