select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 7 and ss.ss_hash <= 407 and c.c_hash >= 234 and c.c_hash <= 984 and cd.cd_hash >= 71 and cd.cd_hash <= 404
;
