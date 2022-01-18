select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 7 and cd.cd_hash <= 107 and c.c_hash >= 410 and c.c_hash <= 460 and hd.hd_hash >= 106 and hd.hd_hash <= 306
;
