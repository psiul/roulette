select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 138 and ss.ss_hash <= 888 and i.i_hash >= 428 and i.i_hash <= 761 and hd.hd_hash >= 549 and hd.hd_hash <= 949
;
