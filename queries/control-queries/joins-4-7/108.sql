select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 657 and ss.ss_hash <= 990 and hd.hd_hash >= 109 and hd.hd_hash <= 859 and c.c_hash >= 387 and c.c_hash <= 787
;
