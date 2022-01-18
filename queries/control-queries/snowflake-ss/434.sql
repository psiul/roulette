select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 244 and ss.ss_hash <= 994 and i.i_hash >= 99 and i.i_hash <= 432 and hd.hd_hash >= 561 and hd.hd_hash <= 961
;
