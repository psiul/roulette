select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 470 and c.c_hash <= 803 and hd.hd_hash >= 498 and hd.hd_hash <= 898 and i.i_hash >= 113 and i.i_hash <= 863
;
