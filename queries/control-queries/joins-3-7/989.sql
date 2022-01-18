select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 4 and ss.ss_hash <= 404 and d.d_hash >= 116 and d.d_hash <= 866 and i.i_hash >= 284 and i.i_hash <= 617
;
