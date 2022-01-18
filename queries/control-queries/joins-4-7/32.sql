select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 312 and ss.ss_hash <= 645 and c.c_hash >= 365 and c.c_hash <= 765 and hd.hd_hash >= 33 and hd.hd_hash <= 783
;
