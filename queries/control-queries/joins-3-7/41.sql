select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 348 and ss.ss_hash <= 681 and d.d_hash >= 85 and d.d_hash <= 835 and i.i_hash >= 209 and i.i_hash <= 609
;
