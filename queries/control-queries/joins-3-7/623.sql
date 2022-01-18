select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 23 and ss.ss_hash <= 356 and i.i_hash >= 75 and i.i_hash <= 825 and d.d_hash >= 180 and d.d_hash <= 580
;
