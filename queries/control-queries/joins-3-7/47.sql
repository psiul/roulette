select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 568 and ss.ss_hash <= 968 and i.i_hash >= 123 and i.i_hash <= 873 and d.d_hash >= 471 and d.d_hash <= 804
;
