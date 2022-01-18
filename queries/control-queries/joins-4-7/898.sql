select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 415 and c.c_hash <= 748 and hd.hd_hash >= 358 and hd.hd_hash <= 758 and cd.cd_hash >= 107 and cd.cd_hash <= 857
;
