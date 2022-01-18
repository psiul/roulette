select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 112 and hd.hd_hash <= 512 and cd.cd_hash >= 607 and cd.cd_hash <= 940 and i.i_hash >= 141 and i.i_hash <= 891
;
