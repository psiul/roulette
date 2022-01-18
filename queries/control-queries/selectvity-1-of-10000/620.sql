select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 246 and cd.cd_hash <= 296 and hd.hd_hash >= 353 and hd.hd_hash <= 453 and c.c_hash >= 45 and c.c_hash <= 65
;
