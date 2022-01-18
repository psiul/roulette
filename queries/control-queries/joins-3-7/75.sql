select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 507 and ss.ss_hash <= 840 and i.i_hash >= 207 and i.i_hash <= 957 and d.d_hash >= 491 and d.d_hash <= 891
;
