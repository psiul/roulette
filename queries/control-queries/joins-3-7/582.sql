select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 304 and ss.ss_hash <= 637 and i.i_hash >= 499 and i.i_hash <= 899 and d.d_hash >= 123 and d.d_hash <= 873
;
