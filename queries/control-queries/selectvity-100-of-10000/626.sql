select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 115 and i.i_hash <= 215 and c.c_hash >= 313 and c.c_hash <= 813 and hd.hd_hash >= 374 and hd.hd_hash <= 574
;
