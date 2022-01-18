select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 217 and ss.ss_hash <= 417 and i.i_hash >= 591 and i.i_hash <= 691 and c.c_hash >= 37 and c.c_hash <= 537
;
