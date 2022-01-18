select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 120 and ss.ss_hash <= 220 and i.i_hash >= 384 and i.i_hash <= 584 and hd.hd_hash >= 122 and hd.hd_hash <= 622
;
