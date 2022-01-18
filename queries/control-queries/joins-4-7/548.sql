select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 17 and ss.ss_hash <= 767 and i.i_hash >= 502 and i.i_hash <= 902 and d.d_hash >= 8 and d.d_hash <= 341
;
