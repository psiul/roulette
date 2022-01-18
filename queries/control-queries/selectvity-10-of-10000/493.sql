select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 274 and hd.hd_hash <= 324 and cd.cd_hash >= 299 and cd.cd_hash <= 499 and c.c_hash >= 193 and c.c_hash <= 293
;
