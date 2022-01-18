select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 140 and ss.ss_hash <= 473 and d.d_hash >= 160 and d.d_hash <= 910 and i.i_hash >= 182 and i.i_hash <= 582
;
