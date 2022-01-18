select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 207 and ss.ss_hash <= 607 and d.d_hash >= 345 and d.d_hash <= 678 and i.i_hash >= 1 and i.i_hash <= 751
;
