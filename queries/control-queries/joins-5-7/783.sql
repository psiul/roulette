select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 597 and ss.ss_hash <= 930 and c.c_hash >= 548 and c.c_hash <= 948 and i.i_hash >= 58 and i.i_hash <= 808
;
