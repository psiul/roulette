select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 388 and ss.ss_hash <= 788 and cd.cd_hash >= 103 and cd.cd_hash <= 853 and c.c_hash >= 22 and c.c_hash <= 355
;
