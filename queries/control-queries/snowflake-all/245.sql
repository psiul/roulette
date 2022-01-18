select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 238 and ss.ss_hash <= 638 and cd.cd_hash >= 236 and cd.cd_hash <= 986 and hd.hd_hash >= 372 and hd.hd_hash <= 705
;
