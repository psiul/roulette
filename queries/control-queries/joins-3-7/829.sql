select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 392 and ss.ss_hash <= 725 and d.d_hash >= 161 and d.d_hash <= 911 and i.i_hash >= 534 and i.i_hash <= 934
;
