select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 253 and ss.ss_hash <= 653 and cd.cd_hash >= 561 and cd.cd_hash <= 894 and c.c_hash >= 151 and c.c_hash <= 901
;
