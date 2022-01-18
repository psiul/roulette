select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 370 and c.c_hash <= 770 and i.i_hash >= 160 and i.i_hash <= 910 and hd.hd_hash >= 420 and hd.hd_hash <= 753
;
