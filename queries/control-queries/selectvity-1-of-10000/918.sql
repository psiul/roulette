select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 428 and ss.ss_hash <= 478 and i.i_hash >= 157 and i.i_hash <= 257 and c.c_hash >= 151 and c.c_hash <= 171
;
