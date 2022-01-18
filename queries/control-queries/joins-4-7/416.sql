select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 29 and c.c_hash <= 779 and hd.hd_hash >= 476 and hd.hd_hash <= 809 and cd.cd_hash >= 223 and cd.cd_hash <= 623
;
