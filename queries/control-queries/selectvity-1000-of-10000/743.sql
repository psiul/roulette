select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 397 and ss.ss_hash <= 797 and i.i_hash >= 31 and i.i_hash <= 364 and c.c_hash >= 95 and c.c_hash <= 845
;
