select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 224 and hd.hd_hash <= 974 and cd.cd_hash >= 104 and cd.cd_hash <= 504 and c.c_hash >= 623 and c.c_hash <= 956
;
