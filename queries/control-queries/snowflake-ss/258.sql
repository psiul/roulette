select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 194 and c.c_hash <= 944 and cd.cd_hash >= 18 and cd.cd_hash <= 418 and i.i_hash >= 604 and i.i_hash <= 937
;
