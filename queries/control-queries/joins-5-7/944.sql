select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 153 and ss.ss_hash <= 486 and c.c_hash >= 339 and c.c_hash <= 739 and hd.hd_hash >= 33 and hd.hd_hash <= 783
;
