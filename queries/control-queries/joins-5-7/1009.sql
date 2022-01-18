select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 431 and ss.ss_hash <= 831 and c.c_hash >= 161 and c.c_hash <= 911 and cd.cd_hash >= 462 and cd.cd_hash <= 795
;
