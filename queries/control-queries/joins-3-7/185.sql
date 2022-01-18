select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 541 and ss.ss_hash <= 941 and i.i_hash >= 61 and i.i_hash <= 811 and d.d_hash >= 415 and d.d_hash <= 748
;
