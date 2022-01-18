select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 117 and ss.ss_hash <= 450 and hd.hd_hash >= 424 and hd.hd_hash <= 824 and i.i_hash >= 84 and i.i_hash <= 834
;
