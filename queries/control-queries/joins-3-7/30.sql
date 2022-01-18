select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 528 and ss.ss_hash <= 861 and i.i_hash >= 191 and i.i_hash <= 941 and d.d_hash >= 564 and d.d_hash <= 964
;
