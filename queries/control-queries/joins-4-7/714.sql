select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 302 and ss.ss_hash <= 635 and cd.cd_hash >= 512 and cd.cd_hash <= 912 and hd.hd_hash >= 210 and hd.hd_hash <= 960
;
