select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 768 and ss.ss_hash <= 968 and hd.hd_hash >= 122 and hd.hd_hash <= 172 and i.i_hash >= 351 and i.i_hash <= 451
;
