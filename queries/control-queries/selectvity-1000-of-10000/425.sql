select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 2 and c.c_hash <= 402 and i.i_hash >= 189 and i.i_hash <= 522 and d.d_hash >= 138 and d.d_hash <= 888
;
