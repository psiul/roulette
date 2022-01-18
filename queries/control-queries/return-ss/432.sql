select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 120 and ss.ss_hash <= 520 and hd.hd_hash >= 214 and hd.hd_hash <= 964 and c.c_hash >= 290 and c.c_hash <= 623
;
