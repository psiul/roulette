select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 928 and ss.ss_hash <= 978 and hd.hd_hash >= 520 and hd.hd_hash <= 540 and c.c_hash >= 707 and c.c_hash <= 807
;
