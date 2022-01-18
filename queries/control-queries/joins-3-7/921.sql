select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 26 and ss.ss_hash <= 776 and d.d_hash >= 187 and d.d_hash <= 587 and i.i_hash >= 18 and i.i_hash <= 351
;
