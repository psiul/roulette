select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 192 and ss.ss_hash <= 942 and c.c_hash >= 305 and c.c_hash <= 705 and cd.cd_hash >= 68 and cd.cd_hash <= 401
;
