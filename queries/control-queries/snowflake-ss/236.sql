select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 87 and ss.ss_hash <= 420 and c.c_hash >= 359 and c.c_hash <= 759 and hd.hd_hash >= 117 and hd.hd_hash <= 867
;
