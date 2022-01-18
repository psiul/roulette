select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 538 and ss.ss_hash <= 871 and d.d_hash >= 487 and d.d_hash <= 887 and i.i_hash >= 137 and i.i_hash <= 887
;
