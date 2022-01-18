select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 431 and ss.ss_hash <= 764 and hd.hd_hash >= 127 and hd.hd_hash <= 877 and i.i_hash >= 445 and i.i_hash <= 845
;
