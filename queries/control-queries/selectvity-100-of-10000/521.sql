select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 103 and c.c_hash <= 203 and cd.cd_hash >= 482 and cd.cd_hash <= 682 and hd.hd_hash >= 339 and hd.hd_hash <= 839
;
