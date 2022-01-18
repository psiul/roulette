select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 555 and ss.ss_hash <= 955 and hd.hd_hash >= 181 and hd.hd_hash <= 931 and cd.cd_hash >= 468 and cd.cd_hash <= 801
;
