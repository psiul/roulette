select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 408 and ss.ss_hash <= 741 and hd.hd_hash >= 226 and hd.hd_hash <= 626 and cd.cd_hash >= 145 and cd.cd_hash <= 895
;
