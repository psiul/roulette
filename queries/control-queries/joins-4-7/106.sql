select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 20 and c.c_hash <= 353 and cd.cd_hash >= 185 and cd.cd_hash <= 585 and hd.hd_hash >= 63 and hd.hd_hash <= 813
;
