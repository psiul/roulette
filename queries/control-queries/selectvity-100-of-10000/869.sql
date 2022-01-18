select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 724 and i.i_hash <= 924 and cd.cd_hash >= 798 and cd.cd_hash <= 898 and d.d_hash >= 79 and d.d_hash <= 579
;
