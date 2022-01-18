select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 327 and d.d_hash <= 727 and i.i_hash >= 99 and i.i_hash <= 849 and c.c_hash >= 586 and c.c_hash <= 919
;
