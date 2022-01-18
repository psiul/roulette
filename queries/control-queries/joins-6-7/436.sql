select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 353 and cd.cd_hash <= 753 and hd.hd_hash >= 275 and hd.hd_hash <= 608 and c.c_hash >= 130 and c.c_hash <= 880
;