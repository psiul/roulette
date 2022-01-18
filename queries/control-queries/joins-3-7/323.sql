select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 40 and ss.ss_hash <= 373 and i.i_hash >= 173 and i.i_hash <= 573 and d.d_hash >= 178 and d.d_hash <= 928
;
