select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 478 and ss.ss_hash <= 878 and i.i_hash >= 606 and i.i_hash <= 939 and d.d_hash >= 16 and d.d_hash <= 766
;
