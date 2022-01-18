select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 41 and ss.ss_hash <= 441 and hd.hd_hash >= 219 and hd.hd_hash <= 969 and c.c_hash >= 273 and c.c_hash <= 606
;
