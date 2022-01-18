select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 350 and ss.ss_hash <= 450 and d.d_hash >= 120 and d.d_hash <= 620 and cd.cd_hash >= 499 and cd.cd_hash <= 699
;
