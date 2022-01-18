select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 59 and hd.hd_hash <= 459 and c.c_hash >= 185 and c.c_hash <= 935 and cd.cd_hash >= 7 and cd.cd_hash <= 340
;
