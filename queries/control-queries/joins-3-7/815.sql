select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 159 and ss.ss_hash <= 492 and d.d_hash >= 51 and d.d_hash <= 801 and i.i_hash >= 28 and i.i_hash <= 428
;
