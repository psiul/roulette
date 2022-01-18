select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 86 and ss.ss_hash <= 586 and cd.cd_hash >= 722 and cd.cd_hash <= 822 and c.c_hash >= 210 and c.c_hash <= 410
;
