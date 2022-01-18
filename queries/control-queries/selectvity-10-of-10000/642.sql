select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 127 and ss.ss_hash <= 177 and i.i_hash >= 434 and i.i_hash <= 634 and hd.hd_hash >= 469 and hd.hd_hash <= 569
;
