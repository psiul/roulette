select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 254 and ss.ss_hash <= 454 and i.i_hash >= 691 and i.i_hash <= 741 and c.c_hash >= 479 and c.c_hash <= 579
;
