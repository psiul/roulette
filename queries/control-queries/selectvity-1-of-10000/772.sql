select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 150 and ss.ss_hash <= 200 and i.i_hash >= 761 and i.i_hash <= 861 and hd.hd_hash >= 528 and hd.hd_hash <= 548
;
