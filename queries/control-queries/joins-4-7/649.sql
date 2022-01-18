select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 440 and ss.ss_hash <= 773 and c.c_hash >= 235 and c.c_hash <= 985 and cd.cd_hash >= 45 and cd.cd_hash <= 445
;
