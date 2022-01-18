select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 410 and ss.ss_hash <= 510 and c.c_hash >= 401 and c.c_hash <= 901 and cd.cd_hash >= 211 and cd.cd_hash <= 411
;
