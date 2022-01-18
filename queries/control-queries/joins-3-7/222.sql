select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 175 and ss.ss_hash <= 508 and d.d_hash >= 41 and d.d_hash <= 791 and i.i_hash >= 248 and i.i_hash <= 648
;
