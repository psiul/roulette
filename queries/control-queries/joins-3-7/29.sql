select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 567 and ss.ss_hash <= 900 and d.d_hash >= 172 and d.d_hash <= 922 and i.i_hash >= 466 and i.i_hash <= 866
;
