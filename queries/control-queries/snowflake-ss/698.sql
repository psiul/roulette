select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 35 and ss.ss_hash <= 368 and i.i_hash >= 201 and i.i_hash <= 951 and hd.hd_hash >= 339 and hd.hd_hash <= 739
;
