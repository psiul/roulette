select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 249 and c.c_hash <= 349 and hd.hd_hash >= 272 and hd.hd_hash <= 472 and cd.cd_hash >= 345 and cd.cd_hash <= 845
;
