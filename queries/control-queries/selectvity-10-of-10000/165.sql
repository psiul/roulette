select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 137 and cd.cd_hash <= 337 and c.c_hash >= 788 and c.c_hash <= 888 and hd.hd_hash >= 456 and hd.hd_hash <= 506
;
