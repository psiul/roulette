select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 118 and ss.ss_hash <= 868 and i.i_hash >= 55 and i.i_hash <= 388 and d.d_hash >= 227 and d.d_hash <= 627
;
