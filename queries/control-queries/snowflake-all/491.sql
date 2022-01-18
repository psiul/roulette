select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 502 and ss.ss_hash <= 902 and cd.cd_hash >= 152 and cd.cd_hash <= 902 and i.i_hash >= 400 and i.i_hash <= 733
;
