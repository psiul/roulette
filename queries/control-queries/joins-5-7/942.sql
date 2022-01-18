select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 200 and ss.ss_hash <= 950 and hd.hd_hash >= 334 and hd.hd_hash <= 734 and cd.cd_hash >= 14 and cd.cd_hash <= 347
;
