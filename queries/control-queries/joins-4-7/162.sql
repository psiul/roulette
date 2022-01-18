select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 28 and ss.ss_hash <= 778 and cd.cd_hash >= 579 and cd.cd_hash <= 912 and hd.hd_hash >= 372 and hd.hd_hash <= 772
;
