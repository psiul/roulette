select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 887 and ss.ss_hash <= 937 and i.i_hash >= 226 and i.i_hash <= 426 and hd.hd_hash >= 540 and hd.hd_hash <= 640
;
