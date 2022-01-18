select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 170 and ss.ss_hash <= 570 and c.c_hash >= 659 and c.c_hash <= 992 and cd.cd_hash >= 114 and cd.cd_hash <= 864
;
