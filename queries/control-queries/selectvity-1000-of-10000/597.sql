select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 486 and hd.hd_hash <= 886 and c.c_hash >= 547 and c.c_hash <= 880 and i.i_hash >= 13 and i.i_hash <= 763
;
