select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 81 and ss.ss_hash <= 831 and hd.hd_hash >= 114 and hd.hd_hash <= 447 and cd.cd_hash >= 119 and cd.cd_hash <= 519
;
