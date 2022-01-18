select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 160 and ss.ss_hash <= 910 and i.i_hash >= 600 and i.i_hash <= 933 and d.d_hash >= 102 and d.d_hash <= 502
;
