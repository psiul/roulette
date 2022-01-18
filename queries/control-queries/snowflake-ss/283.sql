select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 244 and ss.ss_hash <= 994 and c.c_hash >= 258 and c.c_hash <= 591 and i.i_hash >= 62 and i.i_hash <= 462
;
