select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 451 and hd.hd_hash <= 784 and cd.cd_hash >= 56 and cd.cd_hash <= 806 and c.c_hash >= 421 and c.c_hash <= 821
;
