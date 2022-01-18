select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 141 and ss.ss_hash <= 891 and d.d_hash >= 465 and d.d_hash <= 798 and cd.cd_hash >= 494 and cd.cd_hash <= 894
;
