select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 99 and ss.ss_hash <= 849 and i.i_hash >= 175 and i.i_hash <= 575 and d.d_hash >= 512 and d.d_hash <= 845
;
