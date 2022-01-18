select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 500 and ss.ss_hash <= 900 and i.i_hash >= 148 and i.i_hash <= 898 and d.d_hash >= 602 and d.d_hash <= 935
;
