select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 532 and ss.ss_hash <= 932 and i.i_hash >= 403 and i.i_hash <= 736 and d.d_hash >= 216 and d.d_hash <= 966
;
