select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 229 and ss.ss_hash <= 979 and d.d_hash >= 200 and d.d_hash <= 600 and i.i_hash >= 385 and i.i_hash <= 718
;
