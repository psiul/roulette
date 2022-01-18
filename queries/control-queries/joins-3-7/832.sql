select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 587 and ss.ss_hash <= 920 and i.i_hash >= 248 and i.i_hash <= 648 and d.d_hash >= 104 and d.d_hash <= 854
;
