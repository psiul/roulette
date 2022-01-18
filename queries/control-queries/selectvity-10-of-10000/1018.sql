select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 72 and ss.ss_hash <= 272 and hd.hd_hash >= 228 and hd.hd_hash <= 278 and i.i_hash >= 416 and i.i_hash <= 516
;
