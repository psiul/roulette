select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 230 and ss.ss_hash <= 330 and cd.cd_hash >= 719 and cd.cd_hash <= 919 and i.i_hash >= 85 and i.i_hash <= 585
;
