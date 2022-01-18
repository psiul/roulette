select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 473 and c.c_hash <= 973 and i.i_hash >= 363 and i.i_hash <= 563 and hd.hd_hash >= 199 and hd.hd_hash <= 299
;
