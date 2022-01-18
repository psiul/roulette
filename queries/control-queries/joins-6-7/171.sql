select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 110 and ss.ss_hash <= 510 and hd.hd_hash >= 142 and hd.hd_hash <= 892 and cd.cd_hash >= 224 and cd.cd_hash <= 557
;
