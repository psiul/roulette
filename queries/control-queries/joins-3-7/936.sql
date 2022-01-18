select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 463 and ss.ss_hash <= 796 and d.d_hash >= 198 and d.d_hash <= 948 and i.i_hash >= 204 and i.i_hash <= 604
;
