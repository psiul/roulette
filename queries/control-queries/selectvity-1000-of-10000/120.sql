select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 303 and ss.ss_hash <= 703 and c.c_hash >= 178 and c.c_hash <= 511 and i.i_hash >= 175 and i.i_hash <= 925
;
