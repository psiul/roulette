select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 599 and ss.ss_hash <= 999 and d.d_hash >= 91 and d.d_hash <= 841 and i.i_hash >= 275 and i.i_hash <= 608
;
