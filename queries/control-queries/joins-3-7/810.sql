select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and i.i_hash >= 105 and i.i_hash <= 505 and d.d_hash >= 576 and d.d_hash <= 909
;
