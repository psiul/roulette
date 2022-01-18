select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 476 and ss.ss_hash <= 876 and c.c_hash >= 134 and c.c_hash <= 884 and hd.hd_hash >= 26 and hd.hd_hash <= 359
;
