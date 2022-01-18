select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 50 and cd.cd_hash <= 450 and c.c_hash >= 82 and c.c_hash <= 832 and hd.hd_hash >= 344 and hd.hd_hash <= 677
;
