select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 210 and ss.ss_hash <= 610 and d.d_hash >= 633 and d.d_hash <= 966 and i.i_hash >= 8 and i.i_hash <= 758
;
