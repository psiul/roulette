select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 451 and ss.ss_hash <= 784 and hd.hd_hash >= 359 and hd.hd_hash <= 759 and cd.cd_hash >= 9 and cd.cd_hash <= 759
;
