select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 761 and hd.hd_hash <= 811 and c.c_hash >= 237 and c.c_hash <= 257 and cd.cd_hash >= 288 and cd.cd_hash <= 388
;
