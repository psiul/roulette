select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 185 and ss.ss_hash <= 585 and hd.hd_hash >= 72 and hd.hd_hash <= 822 and cd.cd_hash >= 49 and cd.cd_hash <= 382
;
