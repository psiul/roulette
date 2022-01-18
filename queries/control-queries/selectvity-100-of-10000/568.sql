select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 431 and ss.ss_hash <= 931 and i.i_hash >= 783 and i.i_hash <= 883 and cd.cd_hash >= 686 and cd.cd_hash <= 886
;
