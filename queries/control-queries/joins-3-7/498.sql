select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 445 and ss.ss_hash <= 845 and d.d_hash >= 299 and d.d_hash <= 632 and i.i_hash >= 14 and i.i_hash <= 764
;
