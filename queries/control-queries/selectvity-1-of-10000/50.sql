select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 943 and cd.cd_hash <= 993 and i.i_hash >= 300 and i.i_hash <= 400 and c.c_hash >= 306 and c.c_hash <= 326
;
