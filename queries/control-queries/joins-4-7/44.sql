select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 529 and cd.cd_hash <= 862 and c.c_hash >= 92 and c.c_hash <= 842 and hd.hd_hash >= 560 and hd.hd_hash <= 960
;
