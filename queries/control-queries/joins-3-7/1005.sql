select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 523 and ss.ss_hash <= 856 and d.d_hash >= 14 and d.d_hash <= 414 and i.i_hash >= 157 and i.i_hash <= 907
;
