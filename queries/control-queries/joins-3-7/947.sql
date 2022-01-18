select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 438 and ss.ss_hash <= 838 and d.d_hash >= 187 and d.d_hash <= 520 and i.i_hash >= 12 and i.i_hash <= 762
;
