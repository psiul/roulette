select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 340 and ss.ss_hash <= 740 and i.i_hash >= 201 and i.i_hash <= 534 and d.d_hash >= 58 and d.d_hash <= 808
;
