select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 192 and ss.ss_hash <= 942 and cd.cd_hash >= 516 and cd.cd_hash <= 849 and d.d_hash >= 50 and d.d_hash <= 450
;
