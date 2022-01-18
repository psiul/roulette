select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 574 and ss.ss_hash <= 974 and hd.hd_hash >= 58 and hd.hd_hash <= 808 and c.c_hash >= 563 and c.c_hash <= 896
;
