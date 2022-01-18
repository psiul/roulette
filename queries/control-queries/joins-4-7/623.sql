select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 309 and ss.ss_hash <= 642 and hd.hd_hash >= 27 and hd.hd_hash <= 777 and cd.cd_hash >= 559 and cd.cd_hash <= 959
;
