select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 18 and ss.ss_hash <= 418 and c.c_hash >= 386 and c.c_hash <= 719 and hd.hd_hash >= 111 and hd.hd_hash <= 861
;
