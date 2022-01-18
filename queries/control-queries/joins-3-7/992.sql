select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 173 and ss.ss_hash <= 923 and d.d_hash >= 7 and d.d_hash <= 407 and i.i_hash >= 445 and i.i_hash <= 778
;
