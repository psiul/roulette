select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 7 and c.c_hash <= 757 and hd.hd_hash >= 312 and hd.hd_hash <= 712 and cd.cd_hash >= 411 and cd.cd_hash <= 744
;
