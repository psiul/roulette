select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 445 and ss.ss_hash <= 495 and c.c_hash >= 43 and c.c_hash <= 63 and cd.cd_hash >= 555 and cd.cd_hash <= 655
;
