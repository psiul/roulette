select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 527 and ss.ss_hash <= 860 and hd.hd_hash >= 39 and hd.hd_hash <= 439 and cd.cd_hash >= 193 and cd.cd_hash <= 943
;
