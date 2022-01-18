select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 53 and cd.cd_hash <= 453 and c.c_hash >= 194 and c.c_hash <= 944 and hd.hd_hash >= 346 and hd.hd_hash <= 679
;
