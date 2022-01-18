select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 324 and c.c_hash <= 724 and hd.hd_hash >= 117 and hd.hd_hash <= 867 and cd.cd_hash >= 39 and cd.cd_hash <= 372
;
