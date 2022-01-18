select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 31 and hd.hd_hash <= 364 and c.c_hash >= 55 and c.c_hash <= 455 and cd.cd_hash >= 158 and cd.cd_hash <= 908
;
