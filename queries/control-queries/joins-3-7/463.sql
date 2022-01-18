select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 416 and ss.ss_hash <= 749 and i.i_hash >= 136 and i.i_hash <= 536 and d.d_hash >= 96 and d.d_hash <= 846
;
