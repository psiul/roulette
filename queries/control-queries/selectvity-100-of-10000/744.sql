select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 486 and hd.hd_hash <= 686 and c.c_hash >= 311 and c.c_hash <= 811 and i.i_hash >= 803 and i.i_hash <= 903
;
