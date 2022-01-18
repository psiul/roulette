select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 707 and cd.cd_hash <= 807 and hd.hd_hash >= 139 and hd.hd_hash <= 639 and c.c_hash >= 517 and c.c_hash <= 717
;
